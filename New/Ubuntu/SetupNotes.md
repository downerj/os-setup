# Setup Notes: Ubuntu 26.04

## Drive Setup

When setting up a data drive, if dual-booting with Windows, make sure to disable the "Fast Startup Option" on Windows; otherwise the drive will always mount as read-only.

## Nano

Place the following in `~/.nanorc`:
```
# Word wrap around space characters
set atblanks
set softwrap
```

## Ptyxis Terminal

To get the default profile ID:
```bash
dconf read /org/nome/Ptyxis/default-profile-uuid
```

To get all profile IDs:
```bash
dconf read /org/gnome/Ptyxis/profile-uuids
```

The transparency option for a given profile isn't currently available in the settings UI unless you first modify it in the terminal (replacing `$UUID` with the profile ID and `$VALUE` with a value between 0.0 and 1.0):
```bash
dconf write /org/gnome/Ptyxis/Profile/$UUID/opacity $VALUE
```

## Fonts

Fonts can be installed individually using the Files app by opening the font and clicking **Install**.

However, fonts can also be installed for the user by copying them to either of the following locations:
- `~/.local/share/fonts/`
- `~/.fonts/` (Deprecated)

## JSoftware

```bash
curl -fsSL jsoftware.com/download/j9.7/jinstall.sh | sh -s
```

Then move the newly created launchers from the Desktop to the apps folder:
```bash
mv ~/Desktop/*.desktop ~/.local/share/applications/
```

## Apt Packages

```bash

```

## Snap Packages

```bash
apps=(android-studio blender clion code intellij-idea-community julia musescore pycharm-community webstorm)
for app in ${apps[@]}
do
  sudo snap install --classic $app
done
```
