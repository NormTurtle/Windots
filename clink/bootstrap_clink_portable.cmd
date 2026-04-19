@echo off
setlocal

REM Portable setup for this machine.
REM Run once after copying ~/.config/clink to a new system.

set "PROFILE_DIR=%USERPROFILE%\.config\clink"

if not exist "%PROFILE_DIR%" (
  echo [clink] Missing profile dir: %PROFILE_DIR%
  echo [clink] Copy your config folder first.
  exit /b 1
)

clink autorun install -- --profile "%PROFILE_DIR%"
if errorlevel 1 (
  echo [clink] Failed to install autorun.
  exit /b 1
)

echo [clink] Autorun installed with profile: %PROFILE_DIR%
clink --profile "%PROFILE_DIR%" info

endlocal
