#!/usr/bin/env bash

declare -a apt_apps
apt_apps=(\
  bat\
  clang\
  cmake\
  coreutils\
  curl\
  dnsutils\
  dos2unix\
  emacs\
  ffmpeg\
  game-music-emu\
  gdb\
  git\
  imagemagick\
  json-c\
  lynx\
  make\
  mandoc\
  manpages\
  nano\
  ncurses\
  ncurses-utils\
  neofetch\
  nodejs\
  openssh\
  python\
  python-pip\
  tmux\
  tree\
  vim\
  xz-utils\
)

echo -e "Selected Apt apps to install:\n${apt_apps[*]}"
pkg install ${apt_apps[@]}
