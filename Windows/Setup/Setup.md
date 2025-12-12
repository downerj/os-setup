# Windows 11 Setup

## Disable OneDrive Folders
- Open OneDrive (reinstall, if needed).
- Log in, if needed.
- Click the **Backup** tab.
- Uncheck each folder.
- Click the **Account** tab.
- Click **Unlink your PC**.
- Sign out of OneDrive.
- Uninstall OneDrive.
- Open the Registry Editor.
  - Run (Win+R): `regedit`
- Navigate to `Computer\HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders`.
- For each folder that contains `OneDrive\` in the path:
  - Double-click to edit the value.
  - Delete the `OneDrive\` portion (including the slash).
- Close the Registry Editor.
- Restart the PC.
- After logging back in, open Explorer.
  - Run (Win+R): `explorer`
- Navigate to the home directory.
  - Explorer: `Home` or `%USERPROFILE%`.
- Follow these steps for the `Desktop`, `Documents` and `Pictures` folders (and others, as needed):
  - Right-click on the folder and click **Properties**.
  - Click on the **Location** tab.
  - Ensure that the location in the text box does not include `OneDrive\`.

## Control Panel

### Layout
- Open the Control Panel.
  - Explorer: `Control Panel`
  - Run (Win+R): `control`
- Change **View By** to **Large icons**

### Power Options
Note: Fast startup needs to be disabled in order to correctly share drives with Ubuntu when dual-booting.
- Open **Power Options**.
  - Explorer: `Control Panel\All Control Panel Items\Power Options`
- Select **Choose what the power buttons do**.
  - Explorer: `Control Panel\All Control Panel Items\Power Options\System Settings`
- Click **Change settings that are currently unavailable**.
- Uncheck **Turn on fast startup**.
- Click **Save changes**.
- Click **Change when the computer sleeps**.
  - Explorer: `Control Panel\All Control Panel Items\Power Options\Edit Plan Settings`
- For **Put the computer to sleep:** &rarr; **On battery**, choose **Never**.
- For **Put the computer to sleep:** &rarr; **Plugged in**, choose **Never**.
- Click **Save changes**.

## Startup items
- Open the Task Manager.
  - Run (Win+R): `taskmgr`
  - Keyboard shortcut: Ctrl + Shift + Esc
- Click **Startup apps**.
- Disable apps as needed (OneDrive, MS Edge, etc.).

## Drive encryption
Note: BitLocker/encryption needs to be disabled in order to install Ubuntu for dual-booting.
- Open Settings.
- Click **Privacy & security** &rarr; **Device encryption**.
- Uncheck **Device encryption**.
- When prompted "Turn off device encryption?", select **Turn off**.

## Appearance
- Open Settings.
- Click **Personalization** &rarr; **Colors**.
- For **Choose your mode**, select **Dark** (as needed).
- For **Accent color**, select **Manual**.
- Select the desired accent color.

## Taskbar
- Open Settings.
- Click **Personalization**.
- Click **Taskbar**.
- For **Search**, select **Search icon only**.
- Uncheck **Widgets**.
- Expand **Taskbar behaviors**.
- For **Taskbar alignment**, select **Left**.

## Start Menu
- Open Settings.
- Click **Personalization**.
- Click **Start**.
- For **Layout**, select **More pins**.
- Uncheck **Show recently added apps**.
- Uncheck **Show most used apps**.
- Uncheck **Show recommended files in Start...**.
- Uncheck **Show websites from your browsing history**.
- Uncheck **Show recommendations for tips...**.
- Uncheck **Show account-related notifications**.
- Click **Folders**.
- Check **Settings**.
- Check **File Explorer**.
- Check **Network**.

## Power
- Open Settings.
- Click **System**.
- Click **Power & battery**.
- Click **Energy saver**.
- Check **Always use energy saver**.

## Lock screen
- Open Settings.
- Click on **Personalization**.
- Click on **Lock screen**.
- For **Personalize your lock screen**, select **Picture**.
- Uncheck **Get fun facts, tips...**.
- For **Lock screen status**, select **None**.

## Performance settings
- Open Performance Options.
  - Run (Win+R): `SystemPropertiesPerformance`
- Click the **Visual Effects** tab.
- Click the **Custom:** settings.
- Uncheck **Animate controls and elements inside windows**.
- Uncheck **Animate windows when minimizing and maximizing**.
- Uncheck **Animations in the taskbar**.
- Uncheck **Fade or slide menus into view**.
- Uncheck **Fade or slide ToolTips into view**.
- Uncheck **Fade out menu items after clicking**.
- Uncheck **Show window contents while dragging**.
- Uncheck **Slide open combo boxes**.
- Uncheck **Smooth-scroll list boxes**.

## File Explorer options
- Open File Explorer.
  - Run (Win+R): `explorer`
- In the banner near the top of the window, click **See more** (three dots).
- Click **Options**.
- In the new Folder Options window, click the **View** tab.
- In **Advanced settings**:
  - Check **Decrease space between items (compact view)**.
  - Uncheck **Hide extensions for known file types**.

## Cursor
- Open the Control Panel.
  - Run (Win+R): `control`
- Click **Mouse**.
  - Run (Win+R): `main.cpl`
- Click the **Pointers** tab.
- For the **Scheme**, select **Windows Inverted (system scheme)**.
- Click the **Pointer Options** tab.
- Uncheck **Hide pointer while typing**.

## Keyboard
- Open Settings.
- Click **Accessibility**.
- Under **Interaction**, click **Keyboard**.
- Click the **>** arrow next to **Sticky Keys**.
- Uncheck **Keyboard shortcut for Sticky Keys**.
- Go back to **Keyboard**.
- Check **Toggle Keys**. 

## SSH Keys (GitHub, etc.)
- Open PowerShell.
  - Run (Win+R): `pwsh` (PowerShell 7+) or `powershell` (Windows PowerShell)
- Type `ssh-keygen` and hit Enter.
- Follow the prompts, including creating a password for the new SSH key.
- To view the public SSH key, type `Get-Content '.\.ssh\id_ed25519.pub'` and hit Enter.
  - Adjust the path above if the user SSH directory is different or if an algorithm other than Ed25519 was used for generating the key.
