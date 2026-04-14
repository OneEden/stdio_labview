@echo off
REM ============================================================
REM  Simulates a Jenkins build that launches LabVIEW and
REM  captures its log output via bridge.
REM
REM  Flow:
REM    1. Launch LabVIEW (non-blocking, returns immediately)
REM    2. Run bridge.exe (blocks, prints logs to stdout)
REM    3. bridge exits when it sees "LabVIEW Task Done"
REM    4. Script returns bridge's exit code to Jenkins
REM ============================================================

echo [Jenkins] Starting LabVIEW test build...

REM -- Step 1: launch simulated LabVIEW (non-blocking) --
start "" /B sim_labview.exe

REM -- Step 2: bridge captures logs, exits on sentinel --
bridge.exe --stop-on "LabVIEW Task Done"

REM -- Step 3: propagate exit code --
echo [Jenkins] Build finished with exit code %ERRORLEVEL%
exit /b %ERRORLEVEL%
