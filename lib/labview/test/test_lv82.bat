@echo off
setlocal

set RUNNER=%~dp0..\..\..\build\lv_dll_runner_32.exe
set DLL=%~dp0..\builds\example\export_lv82\example.dll
set PASS=0
set FAIL=0

echo [test] Runner: %RUNNER%
echo [test] DLL:    %DLL%
echo.

:: ── HelloWorld ──────────────────────────────────────────────
echo [test] HelloWorld
%RUNNER% "%DLL%" "HelloWorld"
set EXIT=%errorlevel%
if %EXIT% == 0 ( echo [test] PASS & set /a PASS+=1 ) else ( echo [test] FAIL [exit %EXIT%] & set /a FAIL+=1 )
echo.

:: ── CallWithInput ────────────────────────────────────────────
echo [test] CallWithInput
%RUNNER% "%DLL%" "CallWithInput" --input "Hello from runner"
set EXIT=%errorlevel%
if %EXIT% == 0 ( echo [test] PASS & set /a PASS+=1 ) else ( echo [test] FAIL [exit %EXIT%] & set /a FAIL+=1 )
echo.

:: ── CallWithOutput ───────────────────────────────────────────
echo [test] CallWithOutput
%RUNNER% "%DLL%" "CallWithOutput" --output
set EXIT=%errorlevel%
if %EXIT% == 0 ( echo [test] PASS & set /a PASS+=1 ) else ( echo [test] FAIL [exit %EXIT%] & set /a FAIL+=1 )
echo.

:: ── CallWithInputAndOutput ───────────────────────────────────
echo [test] CallWithInputAndOutput
%RUNNER% "%DLL%" "CallWithInputAndOutput" --input "Hello from runner" --output
set EXIT=%errorlevel%
if %EXIT% == 0 ( echo [test] PASS & set /a PASS+=1 ) else ( echo [test] FAIL [exit %EXIT%] & set /a FAIL+=1 )
echo.

:: ── Summary ──────────────────────────────────────────────────
echo ============================================
echo  Results: %PASS% passed, %FAIL% failed
echo ============================================

if %FAIL% == 0 ( exit /b 0 ) else ( exit /b 1 )
