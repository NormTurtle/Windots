@echo off

REM Clink profile startup script.
REM Loaded by appstart.cmd from the profile directory.
REM Keep personal aliases/functions here.
REM Environment Variables
set XDG_CONFIG_HOME=%USERPROFILE%\.config
set XDG_STATE_HOME=%USERPROFILE%\.cache
set XDG_STATE_DIR=%USERPROFILE%\.cache
set XDG_DATA_HOME=%USERPROFILE%\.cache
set EDITOR=nvim.exe
set VISUAL=nvim.exe
set SHELL=cmd

REM Aliases using DOSKEY
doskey vim=nvim.exe $*
doskey ivm=nvim.exe $*
doskey nvide=neovide $*
doskey mvp=mpv $*
doskey et=erd.exe $*
doskey ll=eza $*
doskey yt=yt-dlp $*
doskey which=where $*
doskey tpgt=tgpt $*
doskey cow=cowsay $*
doskey sudo=gsudo $*
doskey py=python $*
doskey ipy=ipython $*
REM doskey jj=attrib "%USERPROFILE%\Downloads\jj" ^| findstr /i /c:"SH" ^>nul ^&^& (attrib "%USERPROFILE%\Downloads\jj" -s -h ^& echo.off) ^|^| (attrib "%USERPROFILE%\Downloads\jj" +s +h ^& echo.on)
doskey scoop=if "$1"=="search" (hok search $2 $3 $4 $5 $6 $7 $8 $9) else if "$1"=="info" (sfsu info $2 $3 $4 $5 $6 $7 $8 $9) else if "$1"=="list" (sfsu list $2 $3 $4 $5 $6 $7 $8 $9) else ("%USERPROFILE%\scoop\shims\scoop.cmd" $*)
doskey kill=taskkill /f /im $* 2>nul || taskkill /f /pid $*

REM Function equivalents as DOSKEY macros
doskey vi=nvim.exe --clean -u %USERPROFILE%\.config\vi\init.lua $*
doskey eza=eza.exe --oneline --long --icons --all --group-directories-first --extended --git --no-permissions --no-time $*
doskey la=eza.exe --oneline --long --icons --all --group-directories-first --extended --git --no-permissions --no-time $*
doskey get=xh -d $*
doskey ex=explorer.exe $*
doskey open=explorer.exe $*
doskey l=dir /b /a-d
doskey cd=if "$*"=="" (cd /d "%USERPROFILE%") else (cd /d $*)

REM Complex functions as DOSKEY macros
REM doskey pgadmin=start "" "C:\Program Files\PostgreSQL\17\pgAdmin 4\python\python.exe" "C:\Program Files\PostgreSQL\17\pgAdmin 4\web\pgAdmin4.py" ^& timeout /t 2 /nobreak ^>nul ^& start "" "http://127.0.0.1:5050"
REM doskey gdi=start "" goodbyedpi


set VIRTUAL_ENV_DISABLE_PROMPT=1
