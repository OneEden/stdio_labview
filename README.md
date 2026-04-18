# stdio_labview

A lightweight console host that lets LabVIEW-compiled DLLs write to stdout/stderr and return a status code — enabling CI systems like Jenkins to capture LabVIEW execution output and exit codes without a TCP bridge or external process.

## How It Works

LabVIEW is a GUI application with no native console output. This project provides `lv_dll_runner.exe`, a thin console host that:

1. Loads a LabVIEW-compiled DLL
2. Calls an exported function using a standard calling convention
3. Forwards stdout/stderr written by the VI directly to the console
4. Propagates the function's return value as the process exit code

CI scripts can invoke `lv_dll_runner.exe` and capture stdout, stderr, and the exit code like any ordinary command-line program.

## Compatibility

| Item | Support |
|------|---------|
| **OS** | Windows XP SP2+, Windows 7/10/11 |
| **LabVIEW** | 8.2+ (32-bit), 2026+ (64-bit); any version that exports C-compatible DLLs |
| **Compiler** | TCC (included); also works with MSVC / MinGW |

## Exported Function Convention

LabVIEW VIs must export functions using `__cdecl` calling convention. Four signatures are supported, selected at runtime via command-line flags.

| Mode | Flags | C Signature | Typical VI Type Example|
|------|-------|-------------|-----------------|
| Default | _(none)_ | `long __cdecl func(char* msg_buf, long* len)` | ![alt text](resource/none.png)|
| Input | `--input <value>` | `long __cdecl func(char* input, char* msg_buf, long* len)` |![alt text](resource/input.png)|
| Output | `--output` | `long __cdecl func(char* msg_buf, char* result_buf, long* len, long* result_len)` | ![alt text](resource/output.png)|
| Input + Output | `--input <value> --output` | `long __cdecl func(char* input, char* msg_buf, char* result_buf, long* len, long* result_len)` | ![alt text](resource/input_output.png)|

| Parameter | Direction | Description |
|-----------|-----------|-------------|
| `input` | in | String argument passed from `--input` |
| `msg_buf` | out | Final status message buffer (4096 bytes) |
| `result_buf` | out | Business result buffer (4096 bytes), printed to stdout |
| `len` | in/out | `msg_buf` size in; LabVIEW writes actual length back |
| `result_len` | in/out | `result_buf` size in; LabVIEW writes actual length back |
| return | — | Exit code: `0` = success, non-zero = error |

In addition to `msg_buf` and `result_buf`, the VI can write freely to stdout and stderr at any time during execution using `kernel32.WriteFile` with the handle obtained from `kernel32.GetStdHandle`.

## Usage

```bat
lv_dll_runner_32.exe <dll_path> <function_name> [--input <value>] [--output]
lv_dll_runner_64.exe <dll_path> <function_name> [--input <value>] [--output]
```

- Use `lv_dll_runner_32.exe` for DLLs compiled by 32-bit LabVIEW (e.g. LV 8.2)
- Use `lv_dll_runner_64.exe` for DLLs compiled by 64-bit LabVIEW (e.g. LV 2026)
- The runner performs a PE bitness check and reports a clear error on mismatch

### Exit Codes

| Code | Meaning |
|------|---------|
| 0 | Success (DLL returned 0) |
| 1 | Usage error |
| 2 | `LoadLibrary` failed |
| 3 | `GetProcAddress` failed |
| 4 | Bitness mismatch between runner and DLL |
| N | DLL returned N (non-zero = error) |

## Output Behaviour

| Buffer | Condition | Destination |
|--------|-----------|-------------|
| `result_buf` | always | stdout |
| `msg_buf` | return == 0 | stdout |
| `msg_buf` | return != 0 | stderr |

Free-form `WriteFile` calls from within the VI go directly to whichever handle (`STD_OUTPUT_HANDLE` or `STD_ERROR_HANDLE`) the VI uses, independent of the buffers above.

## File Structure

```
stdio_labview/
├── README.md
├── build/                                    # Pre-built binaries
│   ├── lv_dll_runner_32.exe                  #   32-bit runner (for LV 8.2 / 32-bit DLLs)
│   └── lv_dll_runner_64.exe                  #   64-bit runner (for LV 2026 / 64-bit DLLs)
└── lib/
    ├── runner_builder/                       # Runner source
    │   ├── lv_dll_runner.c                   #   Console host implementation
    │   └── build.bat                         #   Build script (TCC 32 + 64)
    ├── labview/                              # LabVIEW helper VIs and examples
    │   ├── STD write.vi                      #   Write to stdout/stderr via WriteFile
    │   ├── Parse Error.vi                    #   Format LabVIEW error cluster to string
    │   ├── builds/                           #   Compiled DLL outputs
    │   │   └── example/                      #     Single DLL containing all example VIs
    │   │       ├── export_lv82/              #       32-bit DLL (example.dll)
    │   │       └── export_lv2026/            #       64-bit DLL (example.dll)
    │   ├── example/                          #   Example VI projects (source)
    │   │   ├── HelloWorld/                   #     Default mode (no flags)
    │   │   ├── CallWithInput/                #     --input mode
    │   │   ├── CallWithOutput/               #     --output mode
    │   │   ├── CallWithInputAndOutput/       #     --input --output mode
    │   │   └── Event/                        #     Event-driven: free stdout/stderr + status
    │   └── test/                             #   Test scripts
    │       ├── test_lv2026.bat               #     Run all 64-bit tests
    │       └── test_lv82.bat                 #     Run all 32-bit tests
    └── tcc/                                  # Bundled TCC compiler
        ├── tcc.exe                           #   32-bit compiler
        └── x86_64-win32-tcc.exe              #   64-bit compiler
```

## Building the Runner

```bat
cd lib\runner_builder
build.bat
```

Output: `..\..\build\lv_dll_runner_32.exe` and `..\..\build\lv_dll_runner_64.exe`

## LabVIEW Integration

### Exporting a function from a Shared Library build spec

Configure the **Shared Library** build spec parameters to match the desired mode. Example for `--output` mode:

```
Function name:  MyFunc
Parameters:
  - MessageOut  : C String (Array of char), output, pass by array pointer
  - ResultOut   : C String (Array of char), output, pass by array pointer
  - len         : Long (pointer)
  - lenOfResult : Long (pointer)
Return type:   Long
Calling conv:  C (cdecl)
```

### Writing to stdout / stderr during execution

Use `kernel32.GetStdHandle` to obtain `STD_OUTPUT_HANDLE` (-10) or `STD_ERROR_HANDLE` (-12), then call `kernel32.WriteFile` to write directly. The helper VI `STD write.vi` wraps this pattern.

### Parsing LabVIEW error clusters

Use `Parse Error.vi` to convert a LabVIEW error cluster into a formatted string suitable for `msg_buf` or a `WriteFile` call.
