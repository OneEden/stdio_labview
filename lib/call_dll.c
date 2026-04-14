/*
 * call_dll.c - Load a DLL and call a void(void) function by name.
 * Usage: call_dll.exe <dll_path> <function_name>
 */
#include <windows.h>
#include <stdio.h>

typedef void (__stdcall *VOIDFUNC)(void);

int main(int argc, char* argv[]) {
    HMODULE hDll;
    VOIDFUNC func;

    if (argc < 3) {
        fprintf(stderr, "Usage: call_dll.exe <dll_path> <function_name>\n");
        return 1;
    }

    printf("[call_dll] Loading: %s\n", argv[1]);
    hDll = LoadLibraryA(argv[1]);
    if (!hDll) {
        fprintf(stderr, "[call_dll] LoadLibrary failed: %lu\n", GetLastError());
        return 2;
    }

    func = (VOIDFUNC)GetProcAddress(hDll, argv[2]);
    if (!func) {
        fprintf(stderr, "[call_dll] GetProcAddress('%s') failed: %lu\n", argv[2], GetLastError());
        FreeLibrary(hDll);
        return 3;
    }

    printf("[call_dll] Calling %s()...\n", argv[2]);
    fflush(stdout);
    func();
    printf("[call_dll] %s() returned.\n", argv[2]);

    FreeLibrary(hDll);
    return 0;
}
