@echo off
setlocal

REM Clink autostart entrypoint.
REM Startup priority:
REM 1) %USERPROFILE%\.config\clink\clink_start.cmd
REM 2) %USERPROFILE%\clink_start.cmd
REM 3) %=clink.bin%\clink_start.cmd

set "CLINK_PROFILE_DIR=%USERPROFILE%\.config\clink"

REM if exist "%CLINK_PROFILE_DIR%\clink_start.cmd" call "%CLINK_PROFILE_DIR%\clink_start.cmd"
REM if exist "%USERPROFILE%\clink_start.cmd" call "%USERPROFILE%\clink_start.cmd"
REM if exist "%=clink.bin%\clink_start.cmd" call "%=clink.bin%\clink_start.cmd"

endlocal
