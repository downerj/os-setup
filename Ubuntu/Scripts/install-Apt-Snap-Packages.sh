#!/usr/bin/env bash

# Note: Ruby/Rails needs the following packages:
# build-essential ruby ruby-bundler ruby-dev rustc libssl-dev libyaml-dev zlib1g-dev libgmp-dev

# Note: Clang for C++ (clang++) needs the following packages:
# libstdc++-<version>-dev libc++-dev

#
# Apt packages.
#

declare -a apt_apps
apt_apps=(\
  adb \
  ant \
  arduino \
  assimp-utils \
  audacity \
  avrdude \
  bash-doc \
  build-essential \
  cdrdao \
  clang \
  clang-tidy \
  cmake \
  curl \
  dnsutils \
  elixir \
  emacs \
  erlang \
  eslint \
  f3d \
  fdupes \
  ffmpeg \
  fonts-terminus \
  freeglut3-dev \
  fuse3 \
  g++ \
  gcc \
  gimp \
  glslang-dev \
  glslang-tools \
  golang-go \
  gpart \
  gparted \
  groff \
  imagemagick \
  inkscape \
  jupyter-client \
  jupyter-core \
  jupyter-server \
  kotlin \
  leocad \
  libassimp-dev \
  libc++-dev \
  libstdc++-14-dev \
  libgles-dev \
  libglew-dev \
  libglfw3-dev \
  libglm-dev \
  libglx-dev \
  libgmp-dev \
  libncurses-dev \
  libsdl2-dev \
  libsdl2-doc \
  libsdl2-gfx-dev \
  libsdl2-image-dev \
  libsdl2-mixer-dev \
  libsdl2-net-dev \
  libsdl2-ttf-dev \
  libsfml-dev \
  libssl-dev \
  libtool \
  libtool-bin \
  libvulkan-dev \
  libx11-dev \
  libx11-doc \
  libxcb-doc \
  libxcb-xinput-dev \
  libxcb-xkb-dev \
  libyaml-dev \
  libczmq-dev \
  libzmq3-dev \
  lshw \
  lynx \
  make \
  mesa-utils \
  neofetch \
  nodejs \
  npm \
  ocaml-base \
  openjdk-23-jdk \
  openssh-server \
  pandoc \
  perl \
  php-fpm \
  php \
  postgresql \
  python3 \
  python3-ipykernel \
  python3-pip \
  python3-tk \
  python3-venv \
  qpdf \
  r-base-core \
  ruby \
  ruby-bundler \
  ruby-dev \
  ruby-image-processing \
  rustc \
  samba \
  sgt-launcher \
  sgt-puzzles \
  spirv-tools \
  sqlite3 \
  tcl \
  telnet \
  texlive-latex-extra \
  texlive-latex-recommended \
  tigervnc-viewer \
  tiled \
  tmux \
  tree \
  vim-gtk3 \
  vlc \
  vulkan-tools \
  wit \
  wodim \
  zenity \
  zlib1g-dev \
)
echo -e "Selected Apt apps to install:\n${apt_apps[*]}"
sudo apt install ${apt_apps[*]}

#
# Snap packages.
#

declare -a snap_apps
snap_apps=(\
  android-studio \
  blender \
  clion \
  intellij-idea-community \
  pycharm-community \
  webstorm \
)
echo -e "Selected Snap apps to install\n:${snap_apps[*]}"
for app in ${snap_apps[@]}
do
  sudo snap install --classic $app
done
