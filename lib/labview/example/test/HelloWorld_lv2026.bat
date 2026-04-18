@echo off
setlocal

set RUNNER=%~dp0..\..\..\..\build\lv_dll_runner_64.exe
set DLL=%~dp0..\builds\HelloWorld\export_lv2026\HelloWorld.dll
set FUNC=HelloWorld

echo [test] Runner: %RUNNER%
echo [test] DLL:    %DLL%
echo [test] Func:   %FUNC%
echo.

%RUNNER% "%DLL%" "%FUNC%"
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
