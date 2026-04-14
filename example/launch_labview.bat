@echo off
REM ============================================================
REM  launch_labview.bat
REM
REM  Full lifecycle management:
REM    1. Start LabVIEW (verify it launched)
REM    2. Start bridge.exe in background (capture logs)
REM    3. Poll: detect sentinel completion OR unexpected exit
REM
REM  Usage:
REM    launch_labview.bat [path_to_vi]
REM
REM  Exit codes:
REM    0  - LabVIEW Task Done received (success)
REM    1  - LabVIEW failed to start
REM    2  - LabVIEW exited before sending Task Done
REM    3  - bridge.exe not found
REM ============================================================

set LABVIEW_EXE=C:\Program Files\National Instruments\LabVIEW 8.2\LabVIEW.exe
set LABVIEW_PROC=LabVIEW.exe
set BRIDGE_EXE=C:\bridge\bridge.exe
set SENTINEL=LabVIEW Task Done
set STARTUP_TIMEOUT=30

REM -- Preflight --
if not exist "%BRIDGE_EXE%" (
    echo [launch] ERROR: bridge.exe not found at %BRIDGE_EXE%
    exit /b 3
)

REM -- Step 1: Launch LabVIEW (non-blocking) --
if "%~1"=="" (
    echo [launch] Starting %LABVIEW_PROC%...
    start "" "%LABVIEW_EXE%"
) else (
    echo [launch] Starting %LABVIEW_PROC% with VI: %~1
    start "" "%LABVIEW_EXE%" "%~1"
)

REM -- Step 2: Wait for LabVIEW to appear in tasklist --
echo [launch] Waiting for %LABVIEW_PROC% to start...
set /a COUNT=0
:wait_start
tasklist /NH | findstr /I "%LABVIEW_PROC%" >nul 2>nul
if not errorlevel 1 goto started
set /a COUNT+=1
if %COUNT% GEQ %STARTUP_TIMEOUT% (
    echo [launch] ERROR: %LABVIEW_PROC% did not start within %STARTUP_TIMEOUT%s
    exit /b 1
)
ping 127.0.0.1 -n 2 >nul
goto wait_start

:started
echo [launch] %LABVIEW_PROC% is running.

REM -- Step 3: Start bridge in background --
echo [launch] Starting bridge (stop on: "%SENTINEL%")...
start /B "" "%BRIDGE_EXE%" --stop-on "%SENTINEL%"
ping 127.0.0.1 -n 2 >nul

REM -- Step 4: Poll loop --
:poll
REM Check if bridge exited (sentinel received)
tasklist /NH | findstr /I "bridge.exe" >nul 2>nul
if errorlevel 1 goto bridge_done

REM Check if LabVIEW is still running
tasklist /NH | findstr /I "%LABVIEW_PROC%" >nul 2>nul
if errorlevel 1 goto labview_gone

REM Both alive, keep waiting
ping 127.0.0.1 -n 2 >nul
goto poll

REM -- Exit: bridge exited (got sentinel) --
:bridge_done
echo [launch] bridge exited - sentinel received.
echo [launch] SUCCESS
exit /b 0

REM -- Exit: LabVIEW died unexpectedly --
:labview_gone
echo [launch] WARNING: %LABVIEW_PROC% exited unexpectedly!
REM Give bridge a moment to process any final messages
ping 127.0.0.1 -n 4 >nul
tasklist /NH | findstr /I "bridge.exe" >nul 2>nul
if errorlevel 1 (
    echo [launch] bridge also exited - sentinel may have arrived just before exit.
    exit /b 0
)
echo [launch] ERROR: %LABVIEW_PROC% died without sending "%SENTINEL%"
taskkill /F /IM bridge.exe >nul 2>nul
exit /b 2
