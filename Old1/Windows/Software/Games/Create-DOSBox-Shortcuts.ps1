param (
  [string]$GamesRootFolder = $PSScriptRoot,
  [string]$ShortcutsFolder = "$($env:AppData)\Microsoft\Windows\Start Menu\Programs\My Shortcuts",
  [string]$CustomConfigsFolder = "$GamesRootFolder\CustomConfigs",
  [string]$DosBoxExe = "${env:ProgramFiles(x86)}\DOSBox-0.74-3\DOSBox.exe",
  [switch]$Force = $false
)

#
# Setup data
#

$gameDataMap = @{
  'Chex Quest' = @{
    'icon' = 'CHEX1.ICO'
    'icon-path-is-absolute' = $false
    'subdirectory' = 'CHEX'
    'executable' = 'CHEX.EXE'
    'configurations' = @()
    'disc' = $null
    'disc-is-file' = $false
  }
  'Deluxe Paint' = @{
    'icon' = 'DeluxePaint.ico'
    'icon-path-is-absolute' = $false
    'subdirectory' = 'DP2E30'
    'executable' = 'DP.EXE'
    'configurations' = @()
    'disc' = $null
    'disc-is-file' = $false
  }
  'Descent' = @{
    'icon' = 'goggame-1207663083.ico'
    'icon-path-is-absolute' = $false
    'subdirectory' = 'DESCENT'
    'executable' = 'DESCENTR.EXE'
    'configurations' = @('dosboxDescent.conf')
    'disc' = $null
    'disc-is-file' = $false
  }
  'Descent 2' = @{
    'icon' = 'goggame-1207663093.ico'
    'icon-path-is-absolute' = $false
    'subdirectory' = 'DESCENT2'
    'executable' = 'DESCENT2.EXE'
    'configurations' = @('dosboxDescent2.conf')
    'disc' = 'DESCENT_II.inst'
    'disc-is-file' = $true
  }
  'God of Thunder' = @{
    'icon' = 'GOT.ico'
    'icon-path-is-absolute' = $false
    'subdirectory' = 'GOT'
    'executable' = 'GOT.EXE'
    'configurations' = @()
    'disc' = $null
    'disc-is-file' = $false
  }
  'Heaven & Earth' = @{
    'icon' = 'Heaven.ico'
    'icon-path-is-absolute' = $false
    'subdirectory' = 'HEAVEN'
    'executable' = 'HEAVEN.EXE'
    'configurations' = @()
    'disc' = $null
    'disc-is-file' = $false
  }
  'How Things Work in Busytown' = @{
    'icon' = 'HTW.ICO'
    'icon-path-is-absolute' = $false
    'subdirectory' = 'HTW'
    'executable' = 'HTW\HTW.EXE'
    'configurations' = @()
    'disc' = $null
    'disc-is-file' = $false
  }
  'Jetpack' = @{
    'icon' = 'Jetpack-Icon-64x64.ico'
    'icon-path-is-absolute' = $false
    'subdirectory' = 'JETPACK'
    'executable' = 'JETPACK.EXE'
    'configurations' = @()
    'disc' = $null
    'disc-is-file' = $false
  }
  'MS-DOS Editor' = @{
    'icon' = '%SystemRoot%\System32\pifmgr.dll, 0'
    'icon-path-is-absolute' = $true
    'subdirectory' = 'EDIT'
    'executable' = 'EDIT.COM'
    'configurations' = @()
    'disc' = $null
    'disc-is-file' = $false
  }
  'QuickBASIC X' = @{
    'icon' = 'QBX.ico'
    'icon-path-is-absolute' = $false
    'subdirectory' = 'QBX'
    'executable' = 'QBX.EXE'
    'configurations' = @()
    'disc' = $null
    'disc-is-file' = $false
  }
  'Squarez' = @{
    'icon' = 'Squarez-Icon-81x81.ico'
    'icon-path-is-absolute' = $false
    'subdirectory' = 'SQUAREZ'
    'executable' = 'SQUAREZ.EXE'
    'configurations' = @()
    'disc' = $null
    'disc-is-file' = $false
  }
  'Star Wars - Dark Forces' = @{
    'icon' = 'goggame-1421404433.ico'
    'icon-path-is-absolute' = $false
    'subdirectory' = 'DARK'
    'executable' = 'DARK.EXE'
    'configurations' = @('dosbox_DF.conf')
    'disc' = '.'
    'disc-is-file' = $false
  }
  'Star Wars - Dark Forces Setup' = @{
    'icon' = 'goggame-1421404433.ico'
    'icon-path-is-absolute' = $false
    'subdirectory' = 'DARK'
    'executable' = 'SETUP.EXE'
    'configurations' = @('dosbox_DF.conf')
    'disc' = $null
    'disc-is-file' = $false
  }
}

#
# Create custom configuration files & shortcuts
#

if (-not (Test-Path -Path "$CustomConfigsFolder")) {
  New-Item -ItemType Directory -Path $CustomConfigsFolder
  Write-Host "Created custom configurations folder $CustomConfigsFolder"
}

if (-not (Test-Path -Path "$ShortcutsFolder")) {
  New-Item -ItemType Directory -Path $ShortcutsFolder
  Write-Host "Created shortcuts folder $ShortcutsFolder"
}

$wshShell = New-Object -ComObject WScript.Shell

foreach ($key in $gameDataMap.Keys) {
  $gameName = $key
  $gameData = $gameDataMap[$key]
  $gameSubDir = $gameData['subdirectory']
  $gameFolder = "$GamesRootFolder\$gameSubDir"
  $gameExe = $gameData['executable']
  $gameConfigs = $gameData['configurations'] | ForEach-Object {
    "-conf `"$gameFolder\$_`""
  }
  Write-Host $gameConfigs
  $gameConfigsArg = $gameConfigs -join ' '
  $gameDiscCommand = if ($gameData['disc'] -ne $null) {
    $gameDisc = "$gameFolder\$($gameData['disc'])"
    if ($gameData['disc-is-file'] -eq $true) {
      "imgmount D: `"$gameDisc`" -t iso -fs iso"
    } else {
      "mount D: `"$gameDisc`" -t cdrom"
    }
  } else {
    "REM No disc image/folder provided"
  }
  $shortcutPath = "$ShortcutsFolder\$gameName.lnk"

  #
  # Create DOSBox configuration file
  #

  $condensedGameName = $gameName -replace ' ',''
  $customConfigFile = "$CustomConfigsFolder\dosbox_$condensedGameName.conf"
  if (-not (Test-Path -Path $customConfigFile) -or ($Force -eq $true)) {
    @"
[autoexec]
mount C: "$GamesRootFolder"
$gameDiscCommand
C:
cd $gameSubDir
$gameExe
exit
"@ > $customConfigFile
    Write-Host "Wrote custom config file for $gameName at $customConfigFile"
  } else {
    Write-Host "Skipped existing custom config file for $gameName at $customConfigFile"
  }
  $customConfigArg = "-conf `"$customConfigFile`""

  #
  # Create shell link (shortcut.lnk)
  #

  if (-not (Test-Path -Path $shortcutPath) -or ($Force -eq $true)) {
    $shortcut = $wshShell.CreateShortcut($shortcutPath)
    $shortcut.TargetPath = $DosBoxExe
    $shortcut.Arguments = "-noconsole -exit $gameConfigsArg $customConfigArg"
    $shortcut.WorkingDirectory = $GamesRootFolder
    $shortcut.IconLocation = if ($gameData['icon-path-is-absolute']) {
      $gameData['icon']
    } else {
      "$gameFolder\$($gameData['icon'])"
    }
    $shortcut.Save()
    Write-Host "Wrote shortcut for $gameName at $shortcutPath"
  } else {
    Write-Host "Skipped existing shortcut for $gameName at $shortcutPath"
  }
}