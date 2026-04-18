@echo off
setlocal

set RUNNER=%~dp0..\..\..\..\build\lv_dll_runner_32.exe
set DLL=%~dp0..\builds\CallWithInput\export_lv82\CallWithInput.dll
set FUNC=CallWithInput
set INPUT=Hello from runner

echo [test] Runner: %RUNNER%
echo [test] DLL:    %DLL%
echo [test] Func:   %FUNC%
echo [test] Input:  %INPUT%
echo.

%RUNNER% "%DLL%" "%FUNC%" --input "%INPUT%"
set EXIT=%errorlevel%

echo.
echo [test] Exit code: %EXIT%
if %EXIT% == 0 (
    echo [test] PASS
) else (
    echo [test] FAIL
)

endlocal
exit /b %EXIT%
