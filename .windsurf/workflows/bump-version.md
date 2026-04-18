---
description: Bump version number, rebuild runner, package LabVIEW lib, run tests, tag and release
---

When the user says to bump the version to X.Y.Z, follow these steps:

## Step 1: Update runner source version
Edit `lib/lv_dll_runner/lv_dll_runner.c`, find the line:
```c
#define RUNNER_VERSION "..."
```
Replace the version string with the new version X.Y.Z.

## Step 2: Rebuild lv_dll_runner
Run the build script:
```
lib\lv_dll_runner\build.bat
```
Verify both 32-bit and 64-bit compiled successfully (exit code 0).

## Step 3: Update lvlib version
Edit `lib/labview/src/stdio_labview.lvlib`. Find the XML line:
```xml
<Property Name="NI.Lib.Version" Type="Str">W.X.Y.Z</Property>
```
Replace the version value with X.Y.Z.0 (four-part, fourth digit always 0).

## Step 4: Package LabVIEW source
Compress the contents of `lib/labview/src/` into a zip file named `stdio_labview.X.Y.Z.zip` and place it in the `build/` directory.
Use PowerShell:
```powershell
Compress-Archive -Path "lib\labview\src\*" -DestinationPath "build\stdio_labview.X.Y.Z.zip" -Force
```

## Step 5: Run tests
Run the lv2026 test suite (skip Event):
```
lib\labview\test\test_lv2026.bat
```
Verify all tests pass (Results: N passed, 0 failed).

## Step 6: Commit, tag and push
If all tests pass:
1. Stage all changes:
   ```
   git add -A
   ```
2. Commit:
   ```
   git commit -m "Release vX.Y.Z"
   ```
3. Tag:
   ```
   git tag vX.Y.Z
   ```
4. Push with tags:
   ```
   git push
   git push origin vX.Y.Z
   ```

After pushing the tag, remind the user to go to GitHub → Releases → Draft a new release, select tag vX.Y.Z, and attach the files from `build/`:
- `lv_dll_runner_32.exe`
- `lv_dll_runner_64.exe`
- `stdio_labview.X.Y.Z.zip`
