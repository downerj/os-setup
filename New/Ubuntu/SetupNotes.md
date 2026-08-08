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
sudo apt install adb aptitude arduino assimp-utils avrdude bash-doc bat build-essential cdrdao clang clang-tidy clang-tools cmake curl desmume dialog dnsutils dosbox emacs eslint f3d fastfetch fceux fdupes ffmpeg firefox flatpak fonts-terminus freeglut3-dev fuse3 g++ gcc gimp git glslang-dev glslang-tools gnome-tweaks gpart gparted grafx2 groff handbrake idle imagemagick inkscape jupyter-client jupyter-core jupyter-server kotlin leocad libassimp-dev libc++-dev libstdc++-16-dev libgles-dev libglew-dev libglfw3-dev libglm-dev libgmp-dev libncurses-dev libretro-desmume libretro-mgba libretro-nestopia libretro-snes9x libsdl3-dev libsdl3-doc libsdl3-image-dev libsdl3-image-doc libsdl3-image-tests libsdl3-tests libsdl3-ttf-dev libsdl3-ttf-doc libsfml-dev libtool libtool-bin libvulkan-dev libczmq-dev libzmq3-dev lshw lua5.5 lynx make mesa-utils mgba-sdl mupen64plus-* nodejs npm openjdk-25-jdk openssh-server pandoc perl php-fpm php postgresql pulseaudio-utils python3 python3-ipykernel python3-pip python3-tk python3-venv qpdf retroarch ruby ruby-dev rustc samba scummvm sgt-launcher sgt-puzzles spirv-tools sqlite3 synaptic tcl telnet texmacs tiled tmux tree vim-gtk3 visualboyadvance vlc vulkan-tools wit wodim zenity
```

## Snap Packages

```bash
apps=(android-studio blender clion code intellij-idea-community julia makemkv pycharm-community webstorm)
for app in ${apps[@]}
do
  sudo snap install --classic $app
done
```

### MakeMKV

Visit [forum.makemkv.com/forum/viewtopic.php?t=1053](https://forum.makemkv.com/forum/viewtopic.php?t=1053) for the current beta key.

## MuseScore

Install MuseScore Studio AppImage from [musescore.org](https://musescore.org).

Note: The Snap package `musescore` seems to be broken, so don't install it from Snap.

Make the user apps directory and copy the app image to it (renaming it):
```bash
mkdir -p ~/Applications
cp -i -v ~/Downloads/path/to/MuseScore-Studio-<version>.AppImage ~/Applications/MuseScore-Studio.AppImage
chmod +x ~/Applications/MuseScore-Studio.AppImage
```

Mount the AppImage and extract the icon to the user icons directory:
```bash
mkdir -p ~/.local/share/icons
~/Applications/MuseScore-Studio.AppImage --appimage-mount
# Copy the mount path and run the following in a new terminal
cp -i -v /tmp/<mount-point>/share/icons/hicolor/512x512/apps/mscore4portable.png ~/.local/share/icons/musescore
# End the AppImage mount process (Ctrl+C)
```

Create a desktop launcher at `~/.local/share/applications/MuseScore\ Studio.desktop`:
```ini
[Desktop Entry]
Version=1.0
Terminal=false
Type=Application
Name=MuseScore Studio
Exec=/home/<username>/Applications/MuseScore-Studio.AppImage %U
Icon=/home/<username>/.local/share/icons/musescore
NoDisplay=false
Categories=Audio;
```

## TIC-80

Download Linux binary at [tic80.com/create](https://tic80.com/create).

Install using `dpkg`:
```bash
cd <path-to-download-folder>
sudo dpkg -i tic80-v<version>-linux.deb
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

Download the [startup sound](https://github.com/ubuntu/yaru/raw/refs/heads/master/sounds/src/stereo/warty-startup.oga) from Ubuntu 4.10 Warty Warthog and save it in `~/.local/share/sounds/Custom/stereo/`.

Then write the following to `~/.config/autostart/Play\ Startup\ Sound.desktop`:

```ini
[Desktop Entry]
Type=Application
Name=Play Startup Sound
Exec=/usr/bin/paplay /home/<username>/.local/share/sounds/Custom/stereo/warty-startup.oga
Hidden=false
NoDisplay=false
Icon=audio-volume-high
X-GNOME-Autostart-enabled=true
Name=Play logon sound
```

## Source Code Repositories

Store repositories in `~/Source/`, organizing by host and then by user. For example:
- GitHub [@downerj](https://github.com/downerj): `~/Source/github.com/downerj/`
- GitHub Gists [@downerj](https://gist.github.com/downerj): `~/Source/gist.github.com/downerj/`
- Local/temp projects: `~/Source/tmp/`

This way, the repository URLs matches the file paths. For example:
- GitHub [@downerj/os-setup](https://github.com/downerj/os-setup): `~/Source/github.com/downerj/os-setup`
