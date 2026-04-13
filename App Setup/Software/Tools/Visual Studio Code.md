# Visual Studio Code

## Installing
Visual Studio Code is available for Windows, macOS and Linux.
- [code.visualstudio.com/download](https://code.visualstudio.com/download)
- [vscode.dev](https://vscode.dev/) is a ready-to-use web version for quick edits

## Settings
_See also: [code.visualstudio.com/docs/configure/settings](https://code.visualstudio.com/docs/configure/settings)._

These settings are meant to be added directly to the user settings JSON file, though each can be modified within the Settings window by entering the keyword in the search box within Settings.

The JSON file can be sorted by opening the Command Palette (**Ctrl** + **Shift** + **P** or **Cmd** + **Shift** + **P**) and searching for the command **JSON: Sort Document** (provided by the JSON Language Features extension). Note that using the commands **Sort Lines Ascending** and **Sort Lines Descending** are not meant for JSON and will break nesting.

### JSON
```json
{
  "chat.agent.enabled": false,
  "chat.agentsControl.enabled": "hidden",
  "chat.commandCenter.enabled": false,
  "editor.fontFamily": "'Cascadia Code', 'CMU Typewriter Text', 'Consolas', 'Courier New', 'Fantasque Sans Mono', 'Fira Mono', 'IBM Plex Mono', 'JetBrains Mono', 'PxPlus IBM VGA 9x16', monospace",
  "editor.fontLigatures": true,
  "editor.fontSize": 16,
  "editor.renderWhitespace": "all",
  "editor.tabSize": 2,
  "editor.wordWrap": "on",
  "editor.wrappingIndent": "indent",
  "git.showActionButton": {
    "sync": false
  },
  "telemetry.editStats.enabled": false,
  "telemetry.feedback.enabled": false,
  "telemetry.telemetryLevel": "off",
  "terminal.integrated.defaultProfile.linux": "Bash (Login, Git) 🖥️",
  "terminal.integrated.defaultProfile.windows": "PowerShell 7 🖥️",
  "terminal.integrated.fontFamily": "'Cascadia Code', 'CMU Typewriter Text', 'Consolas', 'Courier New', 'Fantasque Sans Mono', 'Fira Mono', 'IBM Plex Mono', 'JetBrains Mono', 'PxPlus IBM VGA 9x16', monospace",
  "terminal.integrated.fontSize": 16,
  "terminal.integrated.fontWeightBold": "normal",
  "terminal.integrated.profiles.linux": {
      "Bash (Login, Git) 🖥️": {
          "args": [
              "bash",
              "-l"
          ],
          "env": {
              "_my_use_git": "true"
          },
          "icon": "terminal-bash",
          "path": "/usr/bin/env"
      }
  },
  "terminal.integrated.profiles.windows": {
    "PowerShell 7 🖥️": {
      "args": [
        "-NoExit",
        "-Command",
        "$Global:useGit = \"True\""
      ],
      "icon": "terminal-powershell",
      "path": "C:\\Program Files\\PowerShell\\7\\pwsh.exe"
    }
  },
  "window.autoDetectColorScheme": true,
  "window.commandCenter": true,
  "window.restoreWindows": "none",
  "workbench.panel.defaultLocation": "top",
  "workbench.secondarySideBar.defaultVisibility": "hidden",
  "workbench.sideBar.location": "right",
  "workbench.startupEditor": "none"
}
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

## Custom Desktop Launcher (Linux)

Because certain desktop environments (e.g. GNOME) now use Wayland, certain extensions that rely on X11 functionality may not work properly out of the box. For example, GlassIt-VSC depends on X11 for its transparency.
As a workaround, VS Code is able to start using X11/XWayland using the `--ozone-platform=X11` option.

The easiest way to implement this is to either edit the installed desktop shortcut (`/usr/share/applications/code.desktop`) or copy the shorcut to your local shortcuts directory (`~/.local/share/applications/code.desktop`), and find and edit the following lines:
```ini
[Desktop Entry]
Name=Visual Studio Code (X11)
Exec=/usr/share/code/code --ozone-platform=x11 %F

[Desktop Action new-empty-window]
Name=New Empty Window (Wayland)
Exec=/usr/share/code/code --new-window %F
```
You will likely need to log out and back in again to see the changes.
Note that this will likely mask the installed VSCode desktop launcher. Renaming the new file and/or changing the `Name` entry (under `[Desktop Entry]`) should make both launchers appear.
