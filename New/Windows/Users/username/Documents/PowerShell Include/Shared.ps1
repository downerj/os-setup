#
# Key bindings
#

Set-PSReadLineKeyHandler -Key Ctrl+d -ScriptBlock {
  Write-Host 'Bye.'
  [System.Environment]::Exit(0)
}
Set-PSReadLineKeyHandler -Key Ctrl+l -Function ClearScreen
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

#
# Listing colors
#

if ($PSStyle -ne $null) {
  $PSStyle.FileInfo.Directory = $PSStyle.Foreground.BrightCyan
}

#
# History handlers
#

Set-PSReadLineOption -AddToHistoryHandler {
  param(
    [string] $command
  )
  if ($command -like ' *') {
    return $false
  }
  return $true
}

#
# Functions, prompts
#

class My {
  static [bool] $GitEnabled = $false

  static [string] GitGetBranchName() {
    if (-not [My]::GitEnabled) {
      return '---'
    }
    $branch = git branch
      | Select-String '^\*'
      | ForEach-Object { $_.Line -replace '^\* (.+)$','($1)' }
    if ($branch -eq $null) {
      return '(?)'
    }
    return $branch
  }

  static [string] GitGetBranchNameAlt() {
    if (-not [My]::GitEnabled) {
      return '---'
    }
    $branch = git rev-parse --abbrev-ref HEAD
    if ($branch -eq $null) {
      return '(?)'
    }
    if ($branch -eq 'HEAD') {
      $branch = git rev-parse --short HEAD
    }
    if ($branch -eq $null) {
      return '(no branches)'
    }
    return "($branch)"
  }

  static [string] GitGetRepo() {
    return git rev-parse --show-toplevel | Split-Path -Leaf
  }

  static [string] GetColorPrompt() {
    $red = "$([char]27)[91m"
    $green = "$([char]27)[92m"
    $yellow = "$([char]27)[93m"
    $blue = "$([char]27)[94m"
    $magenta = "$([char]27)[95m"
    $cyan = "$([char]27)[96m"
    $white = "$([char]27)[97m"
    $default = "$([char]27)[99m"
    $reset = "$([char]27)[0m"

    $shell = "$magenta$($Script:ShellName)"
    $dateTime = "$blue$(Get-Date -format 'MM/dd HH:mm:ss')"
    $user = "$green$($env:UserName)"
    $at = "$reset@"
    $computer = "$red$($env:ComputerName)"
    $colon = "${reset}:"
    $directory = "$cyan$(Get-Location)"
    $git = "$yellow$([My]::GitGetBranchName())"
    if ($nestedPromptLevel -eq 0) {
      $chevrons = "$magenta>$red>$yellow>$green>$cyan>$blue>$reset"
    } else {
      $chevrons = "$reset$nestedPromptLevel>>>>>>"
    }
    return "$shell $dateTime $user$at$computer$colon$directory`r`n$git $chevrons "
  }

  static [string] GetColorlessPrompt() {
    $shell = $Script:ShellName
    $dateTime = Get-Date -format 'MM/dd HH:mm:ss'
    $user = $env:UserName
    $at = '@'
    $computer = $env:ComputerName
    $colon = ':'
    $directory = Get-Location
    $git = [My]::GitGetBranchName()
    if ($nestedPromptLevel -eq 0) {
      $chevrons = '>>>>>>'
    } else {
      $chevrons = "$nestedPromptLevel >>>>>>"
    }
    return "$shell $dateTime $user$at$computer$colon$directory`r`n$git $chevrons "
  }

  static [string] $PowerShellHistory = "$($env:AppData)\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt"
}

function Prompt {
  if ($Host.UI.SupportsVirtualTerminal) {
    return [My]::GetColorPrompt()
  }
  return [My]::GetColorlessPrompt()
}
