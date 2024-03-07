
Invoke-Expression (&starship init powershell)

Import-Module -Name Terminal-Icons

Set-Alias -Name touch -Value New-Item 

Set-Alias -Name npp -Value Notepad++
function admin {
    if ($args.Count -gt 0) {   
        $argList = "& '" + $args + "'"
        Start-Process "C:\Program Files\PowerShell\7\pwsh.exe" -Verb runAs -ArgumentList $argList
    } else {
        Start-Process "C:\Program Files\PowerShell\7\pwsh.exe" -Verb runAs
    }
}

Set-Alias -Name sudo -Value admin

function ll { Get-ChildItem -Path $pwd -File }

function g { Set-Location $HOME\Documents\Github }

