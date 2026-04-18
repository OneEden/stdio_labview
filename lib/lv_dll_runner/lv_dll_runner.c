/*
 * lv_dll_runner.c - Console host for LabVIEW-compiled DLLs.
 *
 * Calling modes (selected via flags):
 *
 *   (default)
 *     long __cdecl func(char* msg_buf, long* len)
 *
 *   --input <value>
 *     long __cdecl func(char* input, char* msg_buf, long* len)
 *
 *   --output
 *     long __cdecl func(char* msg_buf, char* result_buf, long* len, long* result_len)
 *
 *   --input <value> --output
 *     long __cdecl func(char* input, char* msg_buf, char* result_buf, long* len, long* result_len)
 *
 * msg_buf  → stdout (status==0) or stderr (status!=0)
 * result_buf → stdout (always)
 * Return value is used as the process exit code.
 *
 * Includes PE bitness check to give a clear error on mismatch.
 *
 * Usage:
 *   lv_dll_runner.exe <dll_path> <function_name> [--input <value>] [--output]
 *
 * Exit codes:
 *   0   - success (from DLL return value)
 *   1   - usage error
 *   2   - LoadLibrary failed
 *   3   - GetProcAddress failed
 *   4   - bitness mismatch
 *   N   - DLL returned N (non-zero = error)
 */
#include <windows.h>
#include <stdio.h>

#define RUNNER_VERSION "1.0.0"
#define MSG_BUF_SIZE 4096

typedef long (__cdecl *LVFUNC)        (char* msg_buf, long* len);
typedef long (__cdecl *LVFUNC_IN)     (char* input, char* msg_buf, long* len);
typedef long (__cdecl *LVFUNC_OUT)    (char* msg_buf, char* result_buf, long* len, long* result_len);
typedef long (__cdecl *LVFUNC_IN_OUT) (char* input, char* msg_buf, char* result_buf, long* len, long* result_len);

/*
 * Check PE machine type of a DLL file.
 * Returns 32, 64, or 0 on error.
 */
static int get_pe_bitness(const char* path) {
    HANDLE hFile;
    DWORD read;
    unsigned char buf[4096];
    int pe_offset;
    unsigned short machine;

    hFile = CreateFileA(path, GENERIC_READ, FILE_SHARE_READ, NULL,
                        OPEN_EXISTING, 0, NULL);
    if (hFile == INVALID_HANDLE_VALUE) return 0;

    if (!ReadFile(hFile, buf, sizeof(buf), &read, NULL) || read < 64) {
        CloseHandle(hFile);
        return 0;
    }
    CloseHandle(hFile);

    /* MZ signature check */
    if (buf[0] != 'M' || buf[1] != 'Z') return 0;

    /* PE offset at 0x3C */
    pe_offset = buf[60] | (buf[61] << 8) | (buf[62] << 16) | (buf[63] << 24);
    if (pe_offset + 6 > (int)read) return 0;

    /* PE signature check */
    if (buf[pe_offset] != 'P' || buf[pe_offset + 1] != 'E') return 0;

    /* Machine type at PE + 4 */
    machine = buf[pe_offset + 4] | (buf[pe_offset + 5] << 8);
    if (machine == 0x014C) return 32;  /* IMAGE_FILE_MACHINE_I386 */
    if (machine == 0x8664) return 64;  /* IMAGE_FILE_MACHINE_AMD64 */
    return 0;
}

int main(int argc, char* argv[]) {
    HMODULE hDll;
    LVFUNC func;
    HANDLE hOrigStdout, hOrigStderr;
    int dll_bits, runner_bits;
    char msg_buf[MSG_BUF_SIZE];
    char result_buf[MSG_BUF_SIZE];
    long len, result_len;
    long status;
    const char* opt_input = NULL;
    int opt_output = 0;
    int i;

    if (argc < 3) {
        fprintf(stderr, "lv_dll_runner v" RUNNER_VERSION "\n");
        fprintf(stderr, "Usage: lv_dll_runner.exe <dll_path> <function_name> [--input <value>] [--output]\n");
        return 1;
    }

    /* parse optional flags from argv[3] onwards */
    for (i = 3; i < argc; i++) {
        if (strcmp(argv[i], "--input") == 0 && i + 1 < argc) {
            opt_input = argv[++i];
        } else if (strcmp(argv[i], "--output") == 0) {
            opt_output = 1;
        } else {
            fprintf(stderr, "[runner] Unknown argument: %s\n", argv[i]);
            return 1;
        }
    }

    /* bitness check */
#ifdef _WIN64
    runner_bits = 64;
#else
    runner_bits = 32;
#endif
    dll_bits = get_pe_bitness(argv[1]);
    if (dll_bits == 0) {
        fprintf(stderr, "[runner] WARNING: cannot determine DLL bitness for '%s'\n", argv[1]);
    } else if (dll_bits != runner_bits) {
        fprintf(stderr, "[runner] ERROR: bitness mismatch — runner is %d-bit, DLL is %d-bit\n",
                runner_bits, dll_bits);
        fprintf(stderr, "[runner] Use the %d-bit version of lv_dll_runner.exe\n", dll_bits);
        return 4;
    }

    /* save original console handles BEFORE LoadLibrary */
    hOrigStdout = GetStdHandle(STD_OUTPUT_HANDLE);
    hOrigStderr = GetStdHandle(STD_ERROR_HANDLE);
    hDll = LoadLibraryA(argv[1]);
    if (!hDll) {
        fprintf(stderr, "[runner] LoadLibrary failed: %lu\n", GetLastError());
        return 2;
    }

    /* restore handles — LabVIEW runtime may have redirected them after load */
    SetStdHandle(STD_OUTPUT_HANDLE, hOrigStdout);
    SetStdHandle(STD_ERROR_HANDLE, hOrigStderr);

    func = (LVFUNC)GetProcAddress(hDll, argv[2]);
    if (!func) {
        fprintf(stderr, "[runner] GetProcAddress('%s') failed: %lu\n", argv[2], GetLastError());
        FreeLibrary(hDll);
        return 3;
    }

    msg_buf[0] = '\0';
    result_buf[0] = '\0';
    len = MSG_BUF_SIZE;
    result_len = MSG_BUF_SIZE;

    if (opt_input && opt_output) {
        status = ((LVFUNC_IN_OUT)func)((char*)opt_input, msg_buf, result_buf, &len, &result_len);
    } else if (opt_input) {
        status = ((LVFUNC_IN)func)((char*)opt_input, msg_buf, &len);
    } else if (opt_output) {
        status = ((LVFUNC_OUT)func)(msg_buf, result_buf, &len, &result_len);
    } else {
        status = func(msg_buf, &len);
    }

    msg_buf[MSG_BUF_SIZE - 1] = '\0';
    result_buf[MSG_BUF_SIZE - 1] = '\0';

    /* restore handles — LabVIEW runtime may have redirected them */
    SetStdHandle(STD_OUTPUT_HANDLE, hOrigStdout);
    SetStdHandle(STD_ERROR_HANDLE, hOrigStderr);

    if (result_buf[0] != '\0')
        puts(result_buf);

    if (msg_buf[0] != '\0') {
        if (status == 0)
            puts(msg_buf);
        else
            fputs(msg_buf, stderr);
    }
    fflush(stdout);
    fflush(stderr);

    FreeLibrary(hDll);
    return (int)status;
}
