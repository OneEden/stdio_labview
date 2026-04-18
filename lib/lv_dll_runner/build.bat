@echo off
REM Build lv_dll_runner.exe for both 32-bit and 64-bit
REM Output: build\lv_dll_runner_32.exe and build\lv_dll_runner_64.exe

set TCC32=%~dp0..\tcc\tcc.exe
set TCC64=%~dp0..\tcc\x86_64-win32-tcc.exe
set SRC=%~dp0lv_dll_runner.c
set OUT32=%~dp0..\..\build\lv_dll_runner_32.exe
set OUT64=%~dp0..\..\build\lv_dll_runner_64.exe

if not exist "%~dp0..\..\build" mkdir "%~dp0..\..\build"

echo [build] Compiling 32-bit...
%TCC32% %SRC% -o %OUT32%
if errorlevel 1 (echo [build] 32-bit FAILED & goto :end)
echo [build] OK: %OUT32%

echo [build] Compiling 64-bit...
%TCC64% %SRC% -o %OUT64%
if errorlevel 1 (echo [build] 64-bit FAILED & goto :end)
echo [build] OK: %OUT64%

echo [build] Done.
:end
