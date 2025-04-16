# $stopwatch = [System.Diagnostics.Stopwatch]::StartNew()

# CONFIG_BY_Normturtle :)
#Set-Location "$($env:USERPROFILE)"
# import Modules
# Invoke-Expression (&sfsu hook) # replace the scoop
Import-Module PSReadLine
#Import-Module gsudoModule
# Invoke-Expression (&scoop-search --hook)
Invoke-Expression (&starship init powershell)
Import-Module scoop-completion

# Set Env:variables in shell
#$ [Environment]::SetEnvironmentVariable("VARIABLE", "Value", "User")
# E.g [Environment]::SetEnvironmentVariable("NEOVIDE_MULTIGRID", "1", "User")

# # how to make [[ symblinks? ]]
# New-Item -ItemType SymbolicLink -Path  "C:\Users\path_new_dest"  -Target  "C:\Users\O_0\target_path"

# # Enviroment variables
$env:XDG_CONFIG_HOME = "$Env:USERPROFILE\.config"

$env:XDG_STATE_HOME = "$Env:USERPROFILE\.cache"
$env:XDG_STATE_DIR="$Env:USERPROFILE\.cache"
$env:XDG_DATA_HOME = "$Env:USERPROFILE\.cache"
#$env:PAGER = 'bat'
$EDITOR = 'nvim.exe'
$VISUAL = 'nvim.exe'
Set-Alias -Name vim -Value $EDITOR
Set-Alias -Name ivm -Value $EDITOR
Set-Alias -Name nvide -Value neovide
Set-Alias -Name mvp -Value mpv
Set-Alias -Name et -Value erd.exe
Set-Alias -Name lolcat -Value rainbow
Set-Alias -Name ll -Value  lsd
Set-Alias -Name yt -Value  yt-dlp
Set-Alias -Name which -Value Get-Command
Set-Alias -Name sd -Value speedtest
Set-Alias -Name tpgt -Value tgpt
Set-Alias -Name cow  -Value cowsay
Set-Alias -Name sudo -Value gsudo
Set-Alias -Name py -Value python
Set-Alias -Name ipy -Value ipython

#                                  ╭──────────╮
#                                  │ Function │
#                                  ╰──────────╯
# a Function is just a better alias
function pgadmin { '& "C:\Program Files\PostgreSQL\17\pgAdmin 4\python\python.exe" "C:\Program Files\PostgreSQL\17\pgAdmin 4\web\pgAdmin4.py"','Start-Process "http://127.0.0.1:5050"' | ForEach-Object -Parallel { Invoke-Expression $_ } -ThrottleLimit 2 }
Function vi { nvim.exe --clean -u ~\.config\vi\init.lua  $args } # PluginLess nvim more like vi
Function eza { & eza.exe --oneline --long  --icons --all --group-directories-first --extended --git --no-permissions --no-time }
Function la { eza }
Function note { Start-Process notepads $args -NoNewWindow }
Function get { xh -d $args }
Function ex { explorer.exe $args }
function gdi { goodbyedpi & }
Function hosts { gsudo nvim %windir%\system32\drivers\etc\hosts }
# Function mvi {mpv --config-dir="C:\Users\O_0\scoop\apps\mpv-git\current\portable_config\mvi" $args }

# git
# function graph { git log --all --graph --decorate --oneline }
function graph { git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --branches }

# change dir fastly :D
Function .. { cd ..\ }
function ... { cd ..\.. }
function l { Get-ChildItem -Path $pwd -File } # list only file not folders

function pgrep($name) { ps $name }    # get runnig process info
function pkill($name) { ps $name -ErrorAction SilentlyContinue | kill }  # kill any runnign process
function df { get-volume } # get disk usage
# Function ip { (Invoke-WebRequest http://ifconfig.me/ip ).Content} # get *ONLY* IP
# Function ipinfo { (curl http://ipinfo.io)} # get full info of IP
function unzip {Expand-Archive }   # unzip fliles from  without needing to install anythign
function reload-profile { & $profile -Force }

# # PsReadLine
Set-PSReadLineOption -EditMode Windows
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle InlineView
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key Ctrl+C -Function Copy
Set-PSReadLineKeyHandler -Key Ctrl+v -Function Paste

# downlading yt-dlp with 3gp
# Function yt3gp ($url) { yt-dlp -a "${url}"  -o "%(title)s.%(ext)s" --exec 'ffmpeg -y -i {} -filter:v "scale=704x576" -c:v h263 -c:a aac -b:a 80k -ac 1 -ar 8000 {}.3gp && del /f {}' }

#Lazy loading  Terminal icons ( because it takes to much time )
function Load-TerminalIcons {
    if (-not (Get-Module -Name Terminal-Icons)) {
        Import-Module Terminal-Icons
    }
}
function IconsDelayedLs {
    Load-TerminalIcons
    Get-ChildItem $args
}
Set-Alias -Name ls -Value IconsDelayedLs

# to check what is taking to much time in loading
# $stopwatch.Stop()
# $timeTaken = $stopwatch.ElapsedMilliseconds
# Write-Host "Time taken: $timeTaken ms" -ForegroundColor Yellow
