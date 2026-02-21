# Visual Studio Code

## Installing
Visual Studio Code is available for Windows, macOS and Linux.
- [code.visualstudio.com/download](https://code.visualstudio.com/download)
- [vscode.dev](https://vscode.dev/) is a ready-to-use web version for quick edits

## Settings
_See also: [code.visualstudio.com/docs/configure/settings](https://code.visualstudio.com/docs/configure/settings)._

These settings are meant to be added directly to the user settings JSON file, though each can be modified within the Settings window by entering the keyword in the search box within Settings.

The JSON file can be sorted by opening the Command Palette (**Ctrl** + **Shift** + **P** or **Cmd** + **Shift** + **P**) and searching for the command **JSON: Sort Document** (provided by the JSON Language Features extension). Note that using the commands **Sort Lines Ascending** and **Sort Lines Descending** are not meant for JSON and will break nesting.

### Chat settings
```json
"chat.agent.enabled": false,
"chat.agentsControl.enabled": false,
"chat.commandCenter.enabled": false
```

### Editor settings
```json
"editor.fontFamily": "'Fantasque Sans Mono', 'CMU Typewriter Text', 'Cascadia Code', 'Consolas', 'Courier New', 'Fantasque Sans Mono', 'Fira Mono', 'IBM Plex Mono', 'JetBrains Mono', 'PxPlus IBM VGA 9x16', monospace",
"editor.fontLigatures": true,
"editor.fontSize": 16,
"editor.renderWhitespace": "all",
"editor.tabSize": 2,
"editor.wordWrap": "on",
"editor.wrappingIndent": "indent"
```

### Source control settings
```json
"git.showActionButton": {
  "sync": false
}
```

### Telemetry settings
```json
"telemetry.editStats.enabled": false,
"telemetry.feedback.enabled": false,
"telemetry.telemetryLevel": "off"
```

### Terminal settings
```json
"terminal.integrated.defaultProfile.windows": "PowerShell 7 🖥️",
"terminal.integrated.fontFamily": "'Fantasque Sans Mono', 'CMU Typewriter Text', 'Cascadia Code', 'Consolas', 'Courier New', 'Fantasque Sans Mono', 'Fira Mono', 'IBM Plex Mono', 'JetBrains Mono', 'PxPlus IBM VGA 9x16', monospace",
"terminal.integrated.fontSize": 16,
"terminal.integrated.fontWeightBold": "normal",
"terminal.integrated.profiles.windows": {
  "PowerShell 7 🖥️": {
    "args": [
      "-NoExit",
      "-Command",
      "$useGit = \"True\""
    ],
    "icon": "terminal-powershell",
    "path": "C:\\Program Files\\PowerShell\\7\\pwsh.exe"
  }
}
```

### Window settings
```json
"window.autoDetectColorScheme": true,
"window.commandCenter": true,
"window.restoreWindows": "none"
```

### Workbench settings
```json
"workbench.panel.defaultLocation": "top",
"workbench.secondarySideBar.defaultVisibility": "hidden",
"workbench.sideBar.location": "right",
"workbench.startupEditor": "none"
```

## Third-party extensions

| Extension ID | Name |
| - | - |
| dtoplak.vscode-glsllint | GLSL Lint |
| ms-python.python | Python |
| ms-toolsai.jupyter | Jupyter |
| ms-vscode.cmake-tools | CMake Tools |
| ms-vscode.cpptools | C/C++ |
| s-nlf-fh.glassit | GlassIt-VSC |

