@echo off

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
doskey lolcat=rainbow $*
doskey ll=eza $*
doskey yt=yt-dlp $*
doskey which=where $*
doskey sd=speedtest $*
doskey tpgt=tgpt $*
doskey cow=cowsay $*
doskey sudo=gsudo $*
doskey py=python $*
doskey ipy=ipython $*

REM Function equivalents as DOSKEY macros
doskey vi=nvim.exe --clean -u %USERPROFILE%\.config\vi\init.lua $*
doskey eza=eza.exe --oneline --long --icons --all --group-directories-first --extended --git --no-permissions --no-time $*
doskey la=eza.exe --oneline --long --icons --all --group-directories-first --extended --git --no-permissions --no-time $*
doskey note=notepad.exe $*
doskey get=xh -d $*
doskey ex=explorer.exe $*
doskey open=explorer.exe $*
doskey l=dir /b /a-d
doskey cd=if "$*"=="" (cd /d "%USERPROFILE%") else (cd /d $*)

REM Complex functions as DOSKEY macros
doskey pgadmin=start "" "C:\Program Files\PostgreSQL\17\pgAdmin 4\python\python.exe" "C:\Program Files\PostgreSQL\17\pgAdmin 4\web\pgAdmin4.py" ^& timeout /t 2 /nobreak ^>nul ^& start "" "http://127.0.0.1:5050"
doskey gdi=start "" goodbyedpi



