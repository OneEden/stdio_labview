# LabVIEW-DLL-Runner

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
| **LabVIEW** | Source VIs are saved in LV 8.2 format and open in all modern versions without upgrade dialogs. Tested with LV 2026 (64-bit). Any version that exports C-compatible DLLs is supported. |
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

## Quick Start

1. **Download** the pre-built binaries from [GitHub Releases](../../releases):
   - `lv_dll_runner_32.exe` — for 32-bit LabVIEW DLLs (LV 8.2, XP compatible)
   - `lv_dll_runner_64.exe` — for 64-bit LabVIEW DLLs (LV 2026+)

2. **Export** your VI as a Shared Library DLL using the `__cdecl` calling convention and one of the four supported signatures (see [Exported Function Convention](#exported-function-convention)).

3. **Run** the runner from the command line:
   ```bat
   lv_dll_runner_64.exe MyVI.dll MyFunc
   ```

4. **Capture** stdout, stderr, and the exit code in your CI script as with any ordinary process.

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
└── lib/
    ├── lv_dll_runner/                        # Runner source
    │   ├── lv_dll_runner.c                   #   Console host implementation
    │   └── build.bat                         #   Build script (TCC 32 + 64)
    ├── labview/                              # LabVIEW helper VIs and examples
    │   ├── src/                              #   LabVIEW source library
    │   │   ├── STD write.vi                  #     Write to stdout/stderr via WriteFile
    │   │   ├── Parse Error.vi                #     Format LabVIEW error cluster to string
    │   │   └── stdio_labview.lvlib           #     Library definition
    │   ├── example/                          #   Example VI projects (source)
    │   │   ├── builds/                       #   Compiled DLL outputs
    │   │   │   └── stdio_labview/            #     Single DLL containing all example VIs
    │   │   │       ├── export_lv82/          #       32-bit DLL (example.dll)
    │   │   │       └── export_lv2026/        #       64-bit DLL (example.dll)
    │   │   ├── HelloWorld/                   #     Default mode (no flags)
    │   │   ├── CallWithInput/                #     --input mode
    │   │   ├── CallWithOutput/               #     --output mode
    │   │   ├── CallWithInputAndOutput/       #     --input --output mode
    │   │   └── Event/                        #     Event-driven: free stdout/stderr + status
    │   └── tests/                            #   Test scripts
    │       └── stdio_labview/                #     stdio_labview test suite
    │           ├── test_lv2026.bat           #     Run all 64-bit tests
    │           └── test_lv82.bat             #     Run all 32-bit tests
    └── tcc/                                  # Bundled TCC compiler
        ├── tcc.exe                           #   32-bit compiler
        └── x86_64-win32-tcc.exe              #   64-bit compiler
```

## Building the Runner

### Prerequisites

The runner is built with **TCC 0.9.27** (Tiny C Compiler), which is bundled in `lib/tcc/`:

| Binary | Target |
|--------|--------|
| `lib/tcc/tcc.exe` | 32-bit (i386), compatible with Windows XP SP2+ |
| `lib/tcc/x86_64-win32-tcc.exe` | 64-bit (x86_64), Windows 7+ |

TCC is used because it produces 32-bit binaries that link against MSVCRT and run on Windows XP without any runtime prerequisites. The bundled copy is self-contained — no installation required.

To use a system-installed TCC instead, download TCC 0.9.27 from [bellard.org/tcc](https://bellard.org/tcc/) or [savannah.gnu.org/releases/tinycc](https://download.savannah.gnu.org/releases/tinycc/) and add it to your `PATH`, then update the paths in `lib/lv_dll_runner/build.bat`.

### Build

```bat
lib\lv_dll_runner\build.bat
```

Output: `build\lv_dll_runner_32.exe` and `build\lv_dll_runner_64.exe`

> **Note:** The `build/` directory is not tracked by git. Pre-built binaries are distributed via [GitHub Releases](../../releases).

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
