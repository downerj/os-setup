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

### Installing Everything

To run the automated script to install the J language, the J QT IDE and all addons, run:
```bash
curl -fsSL jsoftware.com/download/j9.7/jinstall.sh | sh -s
```

Then move the newly created launchers from the Desktop to the apps folder:
```bash
mv ~/Desktop/*.desktop ~/.local/share/applications/
```

### Installing Manually

> TODO: Implement this.

## Dolphin Emulator

Visit [dolphin-emu.org/download](https://dolphin-emu.org/download/).

## Apt Packages

```bash
sudo apt install adb aptitude arduino assimp-utils avrdude bash-doc bat build-essential cdrdao clang clang-tidy cmake curl desmume dialog dnsutils dosbox emacs eslint f3d fastfetch fceux fdupes ffmpeg firefox flatpak fonts-terminus freeglut3-dev fuse3 g++ gcc gimp git glslang-dev glslang-tools gnome-tweaks gpart gparted grafx2 groff imagemagick inkscape jupyter-client jupyter-core jupyter-server kotlin leocad libassimp-dev libc++-dev libstdc++-16-dev libgles-dev libglew-dev libglfw3-dev libglm-dev libgmp-dev libncurses-dev libretro-desmume libretro-mgba libretro-nestopia libretro-snes9x libsdl3-dev libsdl3-doc libsdl3-image-dev libsdl3-image-doc libsdl3-image-tests libsdl3-tests libsdl3-ttf-dev libsdl3-ttf-doc libsfml-dev libtool libtool-bin libvulkan-dev libczmq-dev libzmq3-dev lshw lua5.5 lynx make mesa-utils mgba-sdl mupen64plus-* nodejs npm openjdk-25-jdk openssh-server pandoc perl php-fpm php postgresql python3 python3-ipykernel python3-pip python3-tk python3-venv qpdf retroarch ruby ruby-dev rustc samba scummvm sgt-launcher sgt-puzzles spirv-tools sqlite3 synaptic tcl telnet texmacs tiled tmux tree vim-gtk3 visualboyadvance vlc vulkan-tools wit wodim zenity
```

## Snap Packages

```bash
apps=(android-studio blender clion code intellij-idea-community julia musescore pycharm-community webstorm)
for app in ${apps[@]}
do
  sudo snap install --classic $app
done
```

## Hiding App Launchers

To hide an app launcher, find the corresponding `*.desktop` file (in `/usr/share/applications/`, `/.local/share/applications/`, etc.), and add the following lines:
```ini
Hidden=true
NoDisplay=true
```

## Jetpack (Adept Software)

Visit [adeptsoftware.com/jetpack](https://www.adeptsoftware.com/jetpack/).
- Direct download: [adeptsoftware.com/jetpack/jetpak15.zip](https://www.adeptsoftware.com/jetpack/jetpak15.zip).

For the theme pack creator, visit [runevision.com/multimedia/jetpack](https://runevision.com/multimedia/jetpack/).
- Direct download: [runevision.com/multimedia/jetpack/module15.zip)](https://runevision.com/multimedia/jetpack/module15.zip)

## GLAD for OpenGL

Visit [gen.glad.sh](https://gen.glad.sh/).

## GNOME Settings

> TODO: Implement.

## GNOME Logon Sound

> TODO: Implement, using Warty Warthog logon sound.

## Source Code Repositories

Store repositories in `~/Source/`, organizing by host and then by user. For example:
- GitHub [@downerj](https://github.com/downerj): `~/Source/github.com/downerj/`
- GitHub Gists [@downerj](https://gist.github.com/downerj): `~/Source/gist.github.com/downerj/`
- Local/temp projects: `~/Source/tmp/`

This way, the repository URLs matches the file paths. For example:
- GitHub [@downerj/os-setup](https://github.com/downerj/os-setup): `~/Source/github.com/downerj/os-setup`
