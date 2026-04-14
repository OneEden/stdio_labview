/*
 * lv_dll_runner.c - Console host for LabVIEW-compiled DLLs.
 *
 * Loads a DLL and calls a void(__cdecl)(void) function by name.
 * The DLL can write to stdout via GetStdHandle + WriteFile since
 * it shares the host process's console handles.
 *
 * Includes PE bitness check to give a clear error on mismatch.
 *
 * Usage: lv_dll_runner.exe <dll_path> <function_name>
 *
 * Exit codes:
 *   0 - success
 *   1 - usage error
 *   2 - LoadLibrary failed
 *   3 - GetProcAddress failed
 *   4 - bitness mismatch
 */
#include <windows.h>
#include <stdio.h>

typedef void (__cdecl *VOIDFUNC)(void);

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
    VOIDFUNC func;
    HANDLE hOrigStdout, hOrigStderr;
    int dll_bits, runner_bits;

    if (argc < 3) {
        fprintf(stderr, "Usage: lv_dll_runner.exe <dll_path> <function_name>\n");
        return 1;
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

    /* restore handles — LabVIEW runtime may have redirected them */
    SetStdHandle(STD_OUTPUT_HANDLE, hOrigStdout);
    SetStdHandle(STD_ERROR_HANDLE, hOrigStderr);

    func = (VOIDFUNC)GetProcAddress(hDll, argv[2]);
    if (!func) {
        fprintf(stderr, "[runner] GetProcAddress('%s') failed: %lu\n", argv[2], GetLastError());
        FreeLibrary(hDll);
        return 3;
    }

    func();
    fflush(stdout);

    /* restore again in case the function changed them */
    SetStdHandle(STD_OUTPUT_HANDLE, hOrigStdout);
    SetStdHandle(STD_ERROR_HANDLE, hOrigStderr);

    FreeLibrary(hDll);
    return 0;
}
