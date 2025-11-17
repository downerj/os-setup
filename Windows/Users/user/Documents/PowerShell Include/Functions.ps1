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

function My_GetBranchName {
  $branch = git rev-parse --abbrev-ref HEAD
  if ($branch -eq $null) {
    return ""
  }
  if ($branch -eq "HEAD") {
    $branch = git rev-parse --short HEAD
  }
  if ($branch -eq $null) {
    return " (no branches)"
  }
  return " ($branch)"
}

function My_GetColorPrompt {
  $currDir = (Split-Path -Path (Get-Location) -Leaf)
  $compStr = "$red"+"$env:ComputerName"
  $userStr = "$yellow"+"$env:UserName"
  $shellStr = "$magenta"+(My_GetShellName)
  $dirStr = "$cyan$currDir"
  if ($useGit -eq $true) {
    $gitStr = "$green"+(My_GetBranchName)
  }
  if ($nestedPromptLevel -eq 0) {
    $chevronStr = "$magenta>$red>$yellow>$green>$cyan>$blue>"
  } else {
    $chevronStr = "$reset$nestedPromptLevel >>>>>>"
  }
  
  return "$reset$shellStr $compStr$blue::$userStr $blue-> $dirStr$gitStr`r`n$chevronStr$reset "
}

function My_GetNoColorPrompt {
  $currDir = (Split-Path -Path (Get-Location) -Leaf)
  $compStr = "$env:ComputerName"
  $userStr = "$env:UserName"
  $shellStr = (My_GetShellName)
  $dirStr = "$cyan$currDir"
  if ($useGit -eq $true) {
    $gitStr = (My_GetBranchName)
  }
  if ($nestedPromptLevel -eq 0) {
    $chevronStr = ">>>>>>"
  } else {
    $chevronStr = "$nestedPromptLevel >>>>>>"
  }
  
  return "$shellStr $compStr::$userStr -> $dirStr$gitStr`r`n$chevronStr "
}

function Prompt {
  if ($Host.UI.SupportsVirtualTerminal) {
    return (My_GetColorPrompt)
  } else {
    return (My_GetNoColorPrompt)
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

Set-PSReadLineKeyHandler -Key Ctrl+D -Function ViExit
Set-PSReadLineKeyHandler -Key Ctrl+L -Function ClearScreen
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

if ($PSStyle -ne $null) {
  $PSStyle.FileInfo.Directory = $PSStyle.Foreground.BrightCyan
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
