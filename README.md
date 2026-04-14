# LabVIEW Bridge Log

A lightweight TCP bridge that tunnels LabVIEW runtime logs to stdout/stderr, enabling CI systems like Jenkins to capture LabVIEW execution output.

## Goals

LabVIEW is a GUI application that cannot directly output to the console, making it difficult for CI/CD pipelines to monitor LabVIEW task execution in real time. This project solves this with a simple TCP bridging solution:

1. **Real-time log output** — LabVIEW sends logs via DLL, bridge prints to stdout/stderr in real time
2. **Task lifecycle management** — Detect LabVIEW startup, running, completion, and unexpected exit
3. **CI integration** — Scripted invocation with exit code propagation, ready for Jenkins Pipeline

## Compatibility

| Item | Support |
|------|---------|
| **OS** | Windows XP SP2+, Windows 7/10/11 (32-bit PE, runs on Win10 via WoW64) |
| **LabVIEW** | 8.2+ (via Call Library Function Node) |
| **Compiler** | TCC 0.9.27+ (included); also works with MSVC / MinGW |
| **IPC** | TCP localhost:9500 (Winsock2), no session isolation issues |

## Features

### Log Bridge (bridge.exe)

- Listens on `127.0.0.1:9500`, supports up to 16 concurrent clients
- Routes by log level: `INFO:` → stdout, `WARN:` / `ERROR:` → stderr
- Millisecond timestamps, immediate flush
- `--stop-on` sentinel mode: auto-exit when specified text is received

```
bridge.exe [--port <port>] [--stop-on <sentinel>]
```

### Log DLL (bridge_log.dll)

For LabVIEW or any C program:

```c
int log_open(const char* endpoint);               // Connect to bridge (built-in retry: 10 × 500ms)
int log_write(const char* text);                   // Send INFO log
int log_write_level(const char* text, int level);  // Send with level (LOG_INFO/LOG_WARN/LOG_ERROR)
int log_close(void);                               // Disconnect
```

| Return | Constant | Meaning |
|--------|----------|--------|
| 0 | `LOG_OK` | Success |
| -1 | `LOG_ERR_INIT` | Winsock init failed |
| -2 | `LOG_ERR_CONN` | Connection failed |
| -3 | `LOG_ERR_WRITE` | Write failed |
| -4 | `LOG_ERR_PARAM` | Invalid parameter |

### DLL Invoker (call_dll.c)

Generic DLL function caller for invoking `__stdcall void(void)` functions from command line:

```bat
call_dll.exe <dll_path> <function_name>
```

### Process Lifecycle Management (launch_labview.bat)

Complete LabVIEW launch + monitoring script:

1. Start LabVIEW (non-blocking), poll `tasklist` to confirm process exists
2. Start bridge in background to capture logs
3. Continuous polling: detect sentinel arrival (success) or unexpected process exit (failure)

| Exit Code | Meaning |
|-----------|---------|
| 0 | LabVIEW Task Done received |
| 1 | LabVIEW startup timeout |
| 2 | LabVIEW exited without sentinel |
| 3 | bridge.exe not found |

## Architecture

```
┌─────────────────────────────────────────────┐
│  launch_labview.bat / jenkins_build.bat      │  ← CI entry point
│                                              │
│  1. start LabVIEW.exe  (non-blocking)       │
│  2. start bridge.exe   (bg, --stop-on)       │
│  3. poll tasklist to monitor both processes  │
│  4. return exit code                         │
└───────────┬──────────────────────┬───────────┘
            │                      │
   bridge.exe (TCP :9500)    LabVIEW.exe
     stdout/stderr ←── TCP ←── bridge_log.dll
```

## File Structure

```
stdout_labview/
├── README.md
├── lib/                          # Source code
│   ├── bridge.c                  #   Bridge server (TCP → stdout/stderr)
│   ├── bridge_log.h              #   DLL header (for LabVIEW import)
│   ├── bridge_log.c              #   DLL implementation (TCP client with retry)
│   └── call_dll.c                #   Generic DLL function invoker
├── example/                      # Example and test scripts
│   ├── launch_labview.bat        #   Full lifecycle management (launch + monitor + exit)
│   ├── jenkins_build.bat         #   Jenkins build simulation
│   ├── run_bridge.bat            #   Minimal bridge launcher
│   ├── sim_labview.c             #   Simulated LabVIEW process (sends log sequence)
│   └── test_client.c             #   Smoke test client
├── labview/                      # LabVIEW project
│   ├── test.lvproj               #   LabVIEW project file
│   ├── test.vi                   #   Example VI (calls bridge_log.dll)
│   └── My DLL/                   #   Build output
│       ├── SharedLib.dll         #     Compiled DLL (with Test() function)
│       └── SharedLib.h           #     C header
└── tcc/                          # TCC compiler (with supplemental winsock2.h)
```

## Building

```bat
cd lib

:: bridge.exe
..\tcc\tcc.exe bridge.c -lws2_32 -o bridge.exe

:: bridge_log.dll
..\tcc\tcc.exe -shared -DBRIDGE_LOG_EXPORTS bridge_log.c -lws2_32 -o bridge_log.dll

:: call_dll.exe
..\tcc\tcc.exe call_dll.c -o call_dll.exe

:: Example programs (optional)
..\tcc\tcc.exe ..\example\test_client.c bridge_log.c -lws2_32 -o test_client.exe
..\tcc\tcc.exe ..\example\sim_labview.c bridge_log.c -lws2_32 -o sim_labview.exe
```

## Testing

### Manual Test

Terminal 1 — Start bridge:
```bat
bridge.exe
```

Terminal 2 — Run test client:
```bat
test_client.exe
```

### Using LabVIEW-Compiled DLL Test

```bat
bridge.exe --stop-on "LabVIEW Task Done"
:: In another terminal:
call_dll.exe "C:\...\My DLL\SharedLib.dll" Test
```

### Jenkins Scenario Simulation

```bat
jenkins_build.bat
```

Simulates full flow: start sim_labview → bridge captures logs → sentinel received → auto-exit

### Full Lifecycle Test

```bat
launch_labview.bat [path_to_vi]
```

Launches real LabVIEW, polls process status, returns exit code on sentinel or unexpected exit.

## LabVIEW Integration

Call `bridge_log.dll` via **Call Library Function Node** in LabVIEW:

```
Initialize:  log_open("")             ← Connect to 127.0.0.1:9500
Running:     log_write("message")     ← Send log
Finish:      log_write("LabVIEW Task Done")
             log_close()
```
