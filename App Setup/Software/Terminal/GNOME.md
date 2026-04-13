# GNOME Desktop

## Settings commands
```bash
gsettings set org.gnome.TextEditor custom-font 'Fantasque Sans Mono 13'
gsettings set org.gnome.TextEditor highlight-current-line true
gsettings set org.gnome.TextEditor indent-style 'space'
gsettings set org.gnome.TextEditor show-grid true
gsettings set org.gnome.TextEditor show-line-numbers true
gsettings set org.gnome.TextEditor spellcheck false
gsettings set org.gnome.TextEditor style-scheme 'solarized-light'
gsettings set org.gnome.TextEditor tab-width 2
gsettings set org.gnome.TextEditor use-system-font false
gsettings set org.gnome.desktop.calendar show-weekdate true
gsettings set org.gnome.desktop.input-sources xkb-options "['compose:ralt']"
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.session idle-delay 900
gsettings set org.gnome.mutter workspaces-only-on-primary false
gsettings set org.gnome.settings-daemon.plugins.power power-button-action 'suspend'
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing'
gsettings set org.gnome.shell app-picker-layout '[{}]'
gsettings set org.gnome.shell.app-switcher current-workspace-only true
gsettings set org.gnome.shell.extensions.dash-to-dock isolate-monitors true
gsettings set org.gnome.shell.extensions.dash-to-dock isolate-workspaces true
gsettings set org.gnome.shell.extensions.dash-to-dock multi-monitor true
gsettings set org.gnome.shell.extensions.ding show-home false
```

## Set the Startup Sound
```bash
sudo apt install -y pulseaudio-utils

startup_sound="https://github.com/ubuntu/yaru/raw/refs/heads/master/sounds/src/stereo/warty-startup.oga"
sounds_dir="$HOME/.local/share/sounds/Custom/stereo"
mkdir -p "$sounds_dir"
pushd "$sounds_dir"
curl -L -O -R "$startup_sound"
popd
unset sounds_dir startup_sound
```

**~/.config/autostart/StartupSound.desktop**
```ini
[Destkop Entry]
Type=Application
Exec=/usr/bin/paplay ~/.local/share/sounds/Custom/stereo/warty-startup.oga
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name[en_US]=Play login sound
Name=Play login sound
Comment[en_US]=
Comment=
```
