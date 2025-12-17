#!/usr/bin/env bash

declare -a snap_apps
snap_apps=(
  android-studio
  blender
  clion
  intellij-idea-community
  pycharm-community
  webstorm
)
echo -e "Selected Snap apps to install\n:${snap_apps[*]}"
for app in ${snap_apps[@]}
do
  sudo snap install --classic $app
done
