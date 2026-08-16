Set-ItemProperty `
  -Path 'HKLM:\SOFTWARE\Microsoft\Command Processor' `
  -Name 'AutoRun' `
  -Value '"%USERPROFILE%\Documents\Command Prompt\Profile.cmd"'
