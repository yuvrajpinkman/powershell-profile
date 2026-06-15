oh-my-posh init pwsh --config "C:\Users\Yuvraj\Documents\PowerShell\agnoster.omp.json" | Invoke-Expression  ## use local json Profile of OhMyPosh for less latency
Import-Module -Name Terminal-Icons
Invoke-Expression (& { (zoxide init powershell | Out-String) })


Set-Alias -Name touch -Value New-Item 
Set-Alias -Name gcode -Value antigravity 
Set-Alias -Name npp -Value Notepad++   ## Optional(If Notepad Path added)
Set-Alias -Name Drivers -Value SdIO_x64_R827
set-alias -name cat -value bat

# function admin {
#     if ($args.Count -gt 0) {
#         $argList = @($args)
#         Start-Process "C:\Program Files\PowerShell\7\pwsh.exe" -NoLogo -NoProfile -Verb runAs -ArgumentList $argList
#     } else {
#         Start-Process "C:\Program Files\PowerShell\7\pwsh.exe" -NoLogo -NoProfile -Verb runAs
#     }
# }


#C:\Program Files\PowerShell\7\pwsh.exe - path to powershell core MSI installer

# Set-Alias -Name sudo -Value admin

# Chris Titus WinUtil Launch
function toolkit {
    Invoke-WebRequest -useb https://christitus.com/win | Invoke-Expression
}
# Ip function
function get_ip { (Invoke-WebRequest http://ifconfig.me/ip).Content }
# Uptime of system
function uptime {
    if ($PSVersionTable.PSVersion.Major -eq 5) {
        Get-WmiObject win32_operatingsystem | Select-Object @{Name = 'LastBootUpTime'; Expression = { $_.ConverttoDateTime($_.lastbootuptime) } } | Format-Table -HideTableHeaders
    }
    else {
        net statistics workstation | Select-String "since" | ForEach-Object { $_.ToString().Replace('Statistics since ', '') }
    }
}

function docs { Set-Location -Path $HOME\Documents }
function wd { Set-Location -Path $HOME\Documents\Code\wd }
function projects { Set-Location -Path $HOME\Documents\Code\projects }
function coding { Set-Location -Path $HOME\Documents\Code\ }
function loads { Set-Location -Path $HOME\Downloads }
function ll { Get-ChildItem -Path $pwd -File }

function g { Set-Location $HOME\Documents\github }

function sysinfo { Get-ComputerInfo }

function flushdns {
    Clear-DnsClientCache
    Write-Host "DNS has been flushed"
}

Set-PSReadLineOption -Colors @{
    Command   = 'Yellow'
    Parameter = 'Green'
    String    = 'DarkCyan'
}
# customise according to your profile 
function helpme {
    Write-Host "PowerShell Profile Shortcuts:" -ForegroundColor Cyan
    Write-Host "-----------------------------" -ForegroundColor Gray
    
    Write-Host "Navigation:" -ForegroundColor Yellow
    Write-Host "  docs      -> cd ~\Documents"
    Write-Host "  wd        -> cd ~\Documents\Code\wd"
    Write-Host "  projects  -> cd ~\Documents\Code\projects"
    Write-Host "  coding    -> cd ~\Documents\Code\"
    Write-Host "  loads     -> cd ~\Downloads"
    Write-Host "  g         -> cd ~\Documents\github"
    
    Write-Host "`nUtilities:" -ForegroundColor Yellow
    Write-Host "  ll        -> List files"
    Write-Host "  toolkit   -> Chris Titus Tech's WinUtil"
    Write-Host "  get_ip    -> Public IP"
    Write-Host "  uptime    -> System uptime"
    Write-Host "  sysinfo   -> Computer info"
    Write-Host "  flushdns  -> Clear DNS cache"
    Write-Host "  npp       -> Notepad++"
    Write-Host "  touch     -> Create file"
    Write-Host "  Drivers   -> SDIO Driver Installer"
    Write-Host "  yt-dlp    -> YouTube downloader"
    Write-Host "-----------------------------" -ForegroundColor Gray
}

# Import Chocolatey profile if it exists
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
    Import-Module "$ChocolateyProfile"
}



