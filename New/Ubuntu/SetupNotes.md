# Setup Notes: Ubuntu 26.04

## Drive Setup

When setting up a data drive, if dual-booting with Windows, make sure to disable the "Fast Startup Option" on Windows; otherwise the drive will always mount as read-only.

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

First determine the current `<version>` by visiting [code.jsoftware.com/wiki/System/Installation](https://code.jsoftware.com/wiki/System/Installation).

To run the automated script to install the J language, the J QT IDE and all addons, run:
```bash
curl -fsSL jsoftware.com/download/j<version>/jinstall.sh | sh -s
```

To only install slim JQt and no addons:
```bash
curl -fsSL jsoftware.com/download/j<version>/jinstall.sh | sh -s -- -p mydir --qt slim --no-addons
```

Then move the newly created launchers from the Desktop to the apps folder:
```bash
mv ~/Desktop/*.desktop ~/.local/share/applications/
```

You'll need to add a link to the J console to your `PATH`. One way to do this is to ensure you have the following line in your `.bashrc`/`.bash_profile`:
```bash
[[ -d "$HOME/.local/bin" ]] && export PATH="$HOME/.local/bin:$PATH"
```

Then add a link to the J console, making sure to rename it so as to not conflict with the Java `jconsole`:
```bash
mkdir -p ~/.local/bin
ln -s ~/mydir/j<version>/bin/jconsole ~/.local/share/ijconsole
```

## Dolphin Emulator

Visit [dolphin-emu.org/download](https://dolphin-emu.org/download/).

## Apt Packages

```bash
sudo apt install adb aptitude arduino assimp-utils avrdude bash-doc bat build-essential cdrdao clang clang-tidy clang-tools cmake curl desmume dialog dnsutils dos2unix dosbox emacs eslint f3d fastfetch fceux fdupes ffmpeg firefox flatpak fonts-terminus freeglut3-dev fuse3 g++ gcc gimp git glslang-dev glslang-tools gnome-tweaks gpart gparted grafx2 groff handbrake idle imagemagick inkscape jupyter-client jupyter-core jupyter-server kotlin leocad libassimp-dev libc++-dev libstdc++-16-dev libgles-dev libglew-dev libglfw3-dev libglm-dev libgmp-dev libncurses-dev libretro-desmume libretro-mgba libretro-nestopia libretro-snes9x libsdl3-dev libsdl3-doc libsdl3-image-dev libsdl3-image-doc libsdl3-image-tests libsdl3-tests libsdl3-ttf-dev libsdl3-ttf-doc libsfml-dev libtool libtool-bin libvulkan-dev libczmq-dev libzmq3-dev lshw lua5.5 lynx make mesa-utils mgba-sdl mupen64plus-* nodejs npm openjdk-25-jdk openssh-server pandoc perl php-fpm php postgresql pulseaudio-utils python3 python3-ipykernel python3-pip python3-tk python3-venv qpdf retroarch ruby ruby-dev rustc samba scummvm sgt-launcher sgt-puzzles spirv-tools sqlite3 synaptic tcl telnet texmacs tiled tmux tree vim-gtk3 visualboyadvance vlc vulkan-tools wit wodim zenity
```

## Snap Packages

`--classic` apps:
```bash
apps=(android-studio blender clion code intellij-idea-community julia makemkv processing pycharm-community webstorm)
for app in ${apps[@]}
do
  sudo snap install --classic $app
done
```

Other apps:
```bash
apps=(discord)
for app in ${apps[@]}
do
  sudo snap install $app
done
```

## Python 3 launcher

Download the icon for Python3 and put it in the user-level icons folder:
```bash
mkdir -p ~/.local/share/icons
curl -L -R 'https://upload.wikimedia.org/wikipedia/commons/1/1f/Python_logo_01.svg' -o ~/.local/share/icons/python
```

Add the following to all of the old IDLE shortcuts at (`/usr/share/applications/idle*.desktop`) to hide them:
```ini
Hidden=true
```

Create two new shortcuts for Python and IDLE:

`~/.local/share/applications/idle.desktop`:
```ini
[Desktop Entry]
Name=Python IDLE
Comment=Integrated DeveLopment Environment for Python3
Exec=/usr/bin/idle %F
TryExec=/usr/bin/idle
Icon=/home/<username>/.local/share/icons/python
Terminal=false
Type=Application
Categories=Application;Development;
StartupNotify=false
MimeType=text/x-python;
```

`~/.local/share/applications/python.desktop`:
```ini
[Desktop Entry]
Name=Python
Comment=REPL for the Python programming language
Exec=/usr/bin/python3 -i %F
TryExec=/usr/bin/python3
Icon=/home/<username>/.local/share/icons/python
Terminal=true
Type=Application
Categories=Application;Development;
StartupNotify=false
MimeType=text/x-python;
```

## Node.js

Download the icon for Node.js and put it in the user-level icons folder:
```bash
mkdir -p ~/.local/share/icons
curl -L -R 'https://nodejs.org/static/logos/nodejsHex.svg' -o ~/.local/share/icons/node
```

Create a new shortcut for Node.js:

`~/.local/share/applications/node.desktop`:
```ini
[Desktop Entry]
Name=Node.js
Comment=REPL for the JavaScript programming language
Exec=/usr/bin/node -i %F
TryExec=/usr/bin/node
Icon=/home/<username>/.local/share/icons/node
Terminal=true
Type=Application
Categories=Application;Development;
StartupNotify=false
MimeType=text/javascript;
```
## MakeMKV

Visit [forum.makemkv.com/forum/viewtopic.php?t=1053](https://forum.makemkv.com/forum/viewtopic.php?t=1053) for the current beta key.

## MuseScore

Install MuseScore Studio AppImage from [musescore.org](https://musescore.org).

Note: The Snap package `musescore` seems to be broken, so don't install it from Snap.

Make the user apps directory exists and copy the app image to it (renaming it):
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

## MS-DOS Games

After installing DOSBox, create a folder to act as the `C:` drive for DOS (e.g. `~/DOS`).

```bash
mkdir -p <dos-c-drive-dir>
```

Then download the individual DOS software/games and place their folder in the DOS `C:` drive.

### Jetpack (Adept Software)

Visit [adeptsoftware.com/jetpack](https://www.adeptsoftware.com/jetpack/).
- Direct download: [adeptsoftware.com/jetpack/jetpak15.zip](https://www.adeptsoftware.com/jetpack/jetpak15.zip).

For the theme pack creator, visit [runevision.com/multimedia/jetpack](https://runevision.com/multimedia/jetpack/).
- Direct download: [runevision.com/multimedia/jetpack/module15.zip)](https://runevision.com/multimedia/jetpack/module15.zip)

Unzip and place the folders in the DOS `C:` drive:

```bash
cd <path-to-download-folder>
unzip jetpak15.zip
unzip -d module15 module15.zip
mv module15/dpaint.zip ./
unzip -d dpaint dpaint.zip
mv dpaint jetpak15 modeule15 <dos-c-drive-dir>/
```

### Heaven &amp; Earth (Buena Vista Software)

Visit [myabandonware.com/game/heaven-earth-1fb](https://www.myabandonware.com/game/heaven-earth-1fb).

Unzip, rename the folder and place it in the DOS `C:` drive:

```bash
cd <path-to-download-folder>
unzip Heaven-Earth_DOS_EN.zip
mv heaven-and-earth/ heaven
mv heaven <dos-c-drive-dir>/
```

### QuickBASIC and VisualBASIC

Visit [qbasic.net/en/qbasic-downloads/compiler/qbasic-compiler.htm](https://qbasic.net/en/qbasic-downloads/compiler/qbasic-compiler.htm) and Download **QuickBasic 7.1** and **Visual Basic for DOS**.

Unzip and place the folders in the DOS `C:` drive:

```bash
cd <path-to-download-folder>
unzip pds71.zip
unzip -d vbdos vbdos.zip
mv qbx vbdos <dos-c-drive-dir>/
```

### DJGPP &amp; RHIDE

Visit [delorie.com/djgpp/zip-picker.html](https://www.delorie.com/djgpp/zip-picker.html), set the FTP site to `http://www.delorie.com`, select the desired options and click **Tell me which files I need**. Optionally, also find the download link for the `unzip32.exe` executable if extracting archives within DOSBox. 

Example direct downloads:
- [delorie.com/pub/djgpp/current/unzip32.exe](https://www.delorie.com/pub/djgpp/current/unzip32.exe)
- [delorie.com/pub/djgpp/current/v2/copying.dj](http://www.delorie.com/pub/djgpp/current/v2/copying.dj)
- [delorie.com/pub/djgpp/current/v2/djdev205.zip](http://www.delorie.com/pub/djgpp/current/v2/djdev205.zip)
- [delorie.com/pub/djgpp/current/v2/readme.1st](http://www.delorie.com/pub/djgpp/current/v2/readme.1st)
- [delorie.com/pub/djgpp/current/v2apps/rhid15ab.zip](http://www.delorie.com/pub/djgpp/current/v2apps/rhid15ab.zip)
- [delorie.com/pub/djgpp/current/v2gnu/bnu2351b.zip](http://www.delorie.com/pub/djgpp/current/v2gnu/bnu2351b.zip)
- [delorie.com/pub/djgpp/current/v2gnu/em3002b.zip](http://www.delorie.com/pub/djgpp/current/v2gnu/em3002b.zip)
- [delorie.com/pub/djgpp/current/v2gnu/gcc930b.zip](http://www.delorie.com/pub/djgpp/current/v2gnu/gcc930b.zip)
- [delorie.com/pub/djgpp/current/v2gnu/gdb801b.zip](http://www.delorie.com/pub/djgpp/current/v2gnu/gdb801b.zip)
- [delorie.com/pub/djgpp/current/v2gnu/gpp930b.zip](http://www.delorie.com/pub/djgpp/current/v2gnu/gpp930b.zip)
- [delorie.com/pub/djgpp/current/v2gnu/mak44b.zip](http://www.delorie.com/pub/djgpp/current/v2gnu/mak44b.zip)
- [delorie.com/pub/djgpp/current/v2gnu/objc930b.zip](http://www.delorie.com/pub/djgpp/current/v2gnu/objc930b.zip)
- [delorie.com/pub/djgpp/current/v2misc/csdpmi7b.zip](http://www.delorie.com/pub/djgpp/current/v2misc/csdpmi7b.zip)
- [delorie.com/pub/djgpp/current/v2tk/allegro/all422ar2.zip](http://www.delorie.com/pub/djgpp/current/v2tk/allegro/all422ar2.zip)
- [delorie.com/pub/djgpp/current/v2tk/allegro/all422br2.zip](http://www.delorie.com/pub/djgpp/current/v2tk/allegro/all422br2.zip)
- [delorie.com/pub/djgpp/current/v2tk/grx249d.zip](http://www.delorie.com/pub/djgpp/current/v2tk/grx249d.zip)
- [delorie.com/pub/djgpp/current/v2tk/pdcur39a.zip](http://www.delorie.com/pub/djgpp/current/v2tk/pdcur39a.zip)

Then copy and extract all files to a new `DJGPP` directory, and copy it to the DOS `C:` drive.

```bash
cd <path-to-download-folder>
mkdir -p DJGPP
cp copying.dj readme.1st unzip32.exe DJGPP/
for z in *.zip
do
  unzip -d DJGPP/ "$z"
done
mv DJGPP <dos-c-drive-dir>/
```

Then follow the rest of the instructions from the **DJGPP Zip File Picker Results** page, especially the instructions to update `C:\AUTOEXEC.BAT`:

```bat
set PATH=C:\DJGPP\BIN;%PATH%
set DJGPP=C:\DJGPP\DJGPP.ENV
```

## Ardens (Arduboy Emulator)

Download the latest Linux binary (`Ardens_linux_x64.zip`) from [github.com/tiberiusbrown/Ardens/releases](https://github.com/tiberiusbrown/Ardens/releases).

Then unzip and move it to the new apps directory.
```bash
cd <path-to-download-folder>
unzip -d Ardens Ardens_linux_x64.zip
chmod +x Ardens/*.AppImage
mkdir -p ~/Applications
mv Ardens/*.AppImage ~/Applications/
rm -rf Ardens/
```

Mount the main AppImage and extract the icon to the user icons directory.
```bash
mkdir -p ~/.local/share/icons
~/Applications/Ardens-x86_64.AppImage --appimage-mount
# Copy the mount path and run the following in a new terminal
cp -i -v /tmp/<mount-point>/usr/share/icons/hicolor/256x256/apps/ardens.png ~/.local/share/icons/ardens
# End the AppImage mount process (Ctrl+C)
```

Create a desktop launcher at `~/.local/share/applications/Ardens.desktop`:
```ini
[Desktop Entry]
Version=1.0
Terminal=false
Type=Application
Name=Ardens
Exec=/home/<username>/Applications/Ardens-x86_64.AppImage %U
Icon=/home/<username>/.local/share/icons/ardens
NoDisplay=false
Categories=Development;Game;
```

And another at `~/.local/share/applications/Ardens\ Player.desktop`:
```ini
[Desktop Entry]
Version=1.0
Terminal=false
Type=Application
Name=Ardens Player
Exec=/home/<username>/Applications/ArdensPlayer-x86_64.AppImage %U
Icon=/home/<username>/.local/share/icons/ardens
NoDisplay=false
Categories=Development;Game;
```

## GLAD for OpenGL

Visit [gen.glad.sh](https://gen.glad.sh/).

## GNOME Settings

Disable dimming.
```bash
gsettings set org.gnome.settings-daemon.plugins.power idle-dim false
gsettings set org.gnome.settings-daemon.plugins.power idle-brightness 100
```

> TODO: Implement the rest.

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

## Unmounting External USB Drives

To unmount and properly eject an external USB drive (e.g. `/dev/sdX`):
```bash
sudo umount /dev/sdX
udisksctl power-off -b /dev/sdX
```
