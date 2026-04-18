@echo off
setlocal

set RUNNER=%~dp0..\..\..\..\build\lv_dll_runner_32.exe
set DLL=%~dp0..\builds\CallWithInputAndOutput\export_lv82\CallWithInputAndOutput.dll
set FUNC=CallWithInputAndOutput
set INPUT=Hello from runner

echo [test] Runner: %RUNNER%
echo [test] DLL:    %DLL%
echo [test] Func:   %FUNC%
echo [test] Input:  %INPUT%
echo.

%RUNNER% "%DLL%" "%FUNC%" --input "%INPUT%" --output
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
