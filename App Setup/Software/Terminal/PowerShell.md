# PowerShell

**%USERPROFILE%\Documents\PowerShell\Microsoft.PowerShell_profile.ps1**
**%USERPROFILE%\Documents\PowerShell\Profile.ps1**
```pwsh
$Global:shellName = "PS"

. "$PSScriptRoot\..\PowerShell Include\Functions.ps1"
```

**%USERPROFILE%\Documents\WindowsPowerShell\Profile.ps1**
```pwsh
$Global:shellName = "PSWin"

. "$PSScriptRoot\..\PowerShell Include\Functions.ps1"
```

**%USERPROFILE%\Documents\PowerShell Include\Functions.ps1**
```pwsh
$esc = [char]27
$red = "$esc[91m"
$green = "$esc[92m"
$yellow = "$esc[93m"
$blue = "$esc[94m"
$magenta = "$esc[95m"
$cyan = "$esc[96m"
$white = "$esc[97m"
$default = "$esc[99m"
$reset = "$esc[0m"

function My_GitSetUseGit {
  $Global:useGit = $true
}

function My_GitUnsetUseGit {
  $Global:useGit = $false
}

function My_GitDeletePrunedBranches {
  git branch --verbose --verbose `
    | Select-String ': gone]' `
    | ForEach-Object {
      git branch --delete --force ($_.ToString().Trim().Split()[0])
    }
}

function My_GitGetBranchName {
  git branch | Select-String '^\*' | ForEach-Object { $_.Line -replace '^\* (.+)$','($1) ' }
}

function My_GitGetRepo {
  git rev-parse --show-toplevel | Split-Path -Leaf
}

function My_GetColorPrompt {
  $compStr = "$green$($env:ComputerName)"
  $userStr = "$red$($env:UserName)"
  $shellStr = "$reset[$magenta$($Global:shellName)$reset] "
  # $dirStr = "$cyan$(Split-Path -Path (Get-Location) -Leaf)"
  $dirStr = "$cyan$(Get-Location)"
  if ($Global:useGit -eq $true) {
    $gitStr = "`r`n$reset[${yellow}git$reset] $yellow$(My_GitGetBranchName)"
  }
  if ($nestedPromptLevel -eq 0) {
    $chevronStr = "`r`n$magenta>$red>$yellow>$green>$cyan>$blue>$reset "
  } else {
    $chevronStr = "`r`n$reset$nestedPromptLevel >>>>>> "
  }
  
  return "$shellStr$userStr$reset@$compStr$reset`:$dirStr$gitStr$chevronStr"
}

function My_GetNoColorPrompt {
  $compStr = $env:ComputerName
  $userStr = $env:UserName
  $shellStr = "[$($Global:shellName)] "
  # $dirStr = Split-Path -Path (Get-Location) -Leaf
  $dirStr = Get-Location
  if ($Global:useGit -eq $true) {
    $gitStr = "`r`n[git] $(My_GitGetBranchName)"
  }
  if ($nestedPromptLevel -eq 0) {
    $chevronStr = "`r`n>>>>>> "
  } else {
    $chevronStr = "`r`n$nestedPromptLevel >>>>>> "
  }
  
  return "$shellStr$userStr@$compStr`:$dirStr$gitStr$chevronStr"
}

function Prompt {
  if ($Host.UI.SupportsVirtualTerminal) {
    return My_GetColorPrompt
  } else {
    return My_GetNoColorPrompt
  }
}

# function Admin-PS {
#   $isAdmin = (New-Object Security.Principal.WindowsPrincipal(
#     [Security.Principal.WindowsIdentity]::GetCurrent()
#   )).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
#   if (!$isAdmin) {
#     Start-Process `
#       -FilePath "pwsh" `
#       -ArgumentList "-NoExit -Command `"Push-Location '$PWD'`"" `
#       -Verb RunAs
#   }
# }

Set-PSReadLineKeyHandler -Key Ctrl+d -ScriptBlock {
  Write-Host "Bye."
  [System.Environment]::Exit(0)
}
Set-PSReadLineKeyHandler -Key Ctrl+l -Function ClearScreen
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

if ($PSStyle -ne $null) {
  $PSStyle.FileInfo.Directory = $PSStyle.Foreground.BrightCyan
}

Set-PSReadLineOption -AddToHistoryHandler {
  param(
    [string]$command
  )
  return ($command -like ' *')
}

function My_Uninstall {
  param (
    [Parameter(Mandatory)]
    [string]$ProgramName
  )

  $program = Get-ItemProperty `
    "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*", `
    "HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*" `
    | Where-Object { $_.DisplayName -like $ProgramName }

  if ($program) {
    Write-Host "Found program: $($program.DisplayName)"
    $uninstallCommand = $program.UninstallString
    Write-Host "Uninstall command: $uninstallCommand"
    $confirmation = Read-Host "Proceed? [y/N]"
    if ($confirmation -eq 'y') {
      $commandParts = $uninstallCommand.Split(" ")
      $executable = $commandParts[0]
      if ($commandParts.Length -gt 1) {
        $arguments = $commandParts[1..$commandParts.Length] -join " "
      } else {
        $arguments = ""
      }
      Start-Process $executable -ArgumentList $arguments -Wait
    } else {
      Write-Host "Cancelled uninstallation."
    }
  } else {
    Write-Host "Program \"$ProgramName\" not found."
  }
}

function My_SetWindowTitle {
  param (
    [Parameter(Mandatory)]
    [string]$Title
  )
  $Host.UI.RawUI.WindowTitle = $Title
}

$my = [pscustomobject]@{
  PowerShellHistory = "$($env:AppData)\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt"
}

function My_EditPowerShellHistory {
  Invoke-Item $my.PowerShellHistory
}
```
