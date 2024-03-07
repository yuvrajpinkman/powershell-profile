## Please remove # to enable it.
Invoke-Expression (&starship init powershell)

Import-Module -Name Terminal-Icons

Set-Alias -Name touch -Value New-Item 

#Set-Alias -Name npp -Value Notepad++ ## Optional(If Notepad Path added)


function admin {
    if ($args.Count -gt 0) {   
        $argList = "& '" + $args + "'"
        Start-Process "C:\Program Files\PowerShell\7\pwsh.exe" -Verb runAs -ArgumentList $argList 
    } else {
        Start-Process "C:\Program Files\PowerShell\7\pwsh.exe" -Verb runAs
    }
}

#C:\Program Files\PowerShell\7\pwsh.exe - path to powershell core MSI installer

Set-Alias -Name sudo -Value admin

function ll { Get-ChildItem -Path $pwd -File }

function g { Set-Location $HOME\Documents\Github }

