# Command Prompt

Run the following in PowerShell as administrator.
```pwsh
Set-ItemProperty `
  -Path 'HKLM:\SOFTWARE\Microsoft\Command Processor' `
  -Name 'AutoRun' `
  -Value '"%USERPROFILE%\Documents\Command Prompt\profile.cmd"'
```

**%USERPROFILE%\Documents\Command Prompt\profile.cmd**
_Note: The unprintable characters below are all the ASCII Escape character (U+001B, `\x1b`, `\u001b`) and need to be copied verbatim into the command file. You may need to open this markdown file in a source code editor and copy the prompt from there._ 
```cmd
@prompt [0m[[95mCMD[0m] [91m%USERNAME%[0m@[92m%COMPUTERNAME%[0m:[96m$P$_[1;35m$G[1;31m$G[1;33m$G[1;32m$G[1;36m$G[1;34m$G[0m 
```
