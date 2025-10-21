#!/usr/bin/env bash

gsettings set org.gnome.TextEditor custom-font 'Fantasque Sans Mono 13'
gsettings set org.gnome.TextEditor highlight-current-line true
gsettings set org.gnome.TextEditor indent-style 'space'
gsettings set org.gnome.TextEditor show-grid true
gsettings set org.gnome.TextEditor show-line-numbers true
gsettings set org.gnome.TextEditor spellcheck false
gsettings set org.gnome.TextEditor style-scheme 'solarized-light'
gsettings set org.gnome.TextEditor tab-width uint32 8
gsettings set org.gnome.TextEditor use-system-font false
gsettings set org.gnome.desktop.calendar show-weekdate true
gsettings set org.gnome.desktop.input-sources xkb-options ['compose:ralt']
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.session idle-delay uint32 900
gsettings set org.gnome.mutter workspaces-only-on-primary false
gsettings set org.gnome.settings-daemon.plugins.power power-button-action 'suspend'
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing'
gsettings set org.gnome.shell app-picker-layout [{}]
gsettings set org.gnome.shell.app-switcher current-workspace-only true
gsettings set org.gnome.shell.extensions.dash-to-dock isolate-monitors true
gsettings set org.gnome.shell.extensions.dash-to-dock isolate-workspaces true
gsettings set org.gnome.shell.extensions.dash-to-dock multi-monitor true
gsettings set org.gnome.shell.extensions.ding show-home false
