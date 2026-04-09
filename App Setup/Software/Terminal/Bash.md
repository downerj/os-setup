# Bash

## ~/.bashrc
This file has been edited from the default `~/.bashrc` included with Ubuntu Linux.
The edits consist primarily of commented/uncommented lines.
The user's additional customizations are found in `~/.bash_aliases`.
```bash
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
#case "$TERM" in
#    xterm-color|*-256color) color_prompt=yes;;
#esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

#if [ -n "$force_color_prompt" ]; then
#    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
#	# We have color support; assume it's compliant with Ecma-48
#	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
#	# a case would tend to support setf rather than setaf.)
#	color_prompt=yes
#    else
#	color_prompt=
#    fi
#fi

#if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#    ;;
#*)
#    ;;
#esac

# enable color support of ls and also add handy aliases
#if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
#    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
#fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -alF'
#alias la='ls -A'
#alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
```

## ~/.bash_profile
```bash
[ -f "/etc/bash.bashrc" ] && source "/etc/bash.bashrc"
[ -f "${HOME}/.bashrc" ] && source "$HOME/.bashrc"
```

## ~/.bash_aliases
```bash
#!/usr/bin/env bash

##
# Shell options
# =========
# See also: https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
##

# Store multi-line commands as a single command
shopt -s cmdhist

# Check the window size after each command, and update the values of LINES and COLUMNS
shopt -s checkwinsize

# See also: https://www.gnu.org/software/bash/manual/html_node/Aliases.html
shopt -s expand_aliases

##
# Command aliases
# To get the original command, use `command` or `/usr/bin/env`, e.g.:
# command ls
# /usr/bin/env ls
# ==========
# See also: https://tldp.org/LDP/abs/html/aliases.html
##

# Query (-i) on copy/move overwriting and on delete, and use verbose output (-v)
# This makes overwriting and deleting safer from accidents
alias cp="cp -i -v"
alias mv="mv -i -v"
alias rm="rm -i -v"
alias rmdir="rmdir -v"

# Use human-readable file sizes (-h) when checking free space and disk sizes
alias df="df -h"
alias du="du -h"

# Colorize directory listings (--color=auto), list by lines (-x), append indicators (-F)
# and group folder first (--group-directories-first)
alias ls="ls -F -x --color=auto --group-directories-first"

##
# Custom prompt string
# ==========
# See also: https://www.gnu.org/software/bash/manual/html_node/Controlling-the-Prompt.html
# See also: https://tldp.org/HOWTO/Bash-Prompt-HOWTO/
##

# Check for color support from the terminal
function my_has_color {
  case "$TERM" in
    xterm-color|*-256color)
      printf 'true';;
    *)
      printf 'false';;
  esac
}

# 4-bit foreground color codes (3*, 9*) are listed below
# 4-bit background color codes (4*, 10*) could be used as well
# These colors are affected by the terminal's settings and could look completely different
# Use 8-bit (38;5;* and 48:5;*) or 24-bit (38;2;*;*;* and 48;2;*;*;*) colors to force
# specific colors and to have more options
# See also: https://en.wikipedia.org/wiki/ANSI_escape_code
black="90"
red="91"
yellow="93"
green="92"
cyan="96"
blue="94"
magenta="95"
white="97"
defl="39"
bold="1"
reset="0"

# If git is supported, then get the branch/commit name
function my_write_git () {
  if [[ "$_my_use_git" == 'true' ]]
  then
    printf "\n[git] "
    git branch 2>/dev/null | grep -e ^* | sed -E s/\\\*\ \(.+\)$/\(\\\1\)\ /
  else
    printf ""
  fi
}

function my_use_git () {
  _my_use_git="true"
}

function my_unuse_git () {
  unset _my_use_git
}

# First line of the custom prompt
if [[ $(my_has_color) == 'true' ]]
then
  first_line="\[\e[$reset;$bold;${red}m\]\u\[\e[${defl}m\]@\[\e[${green}m\]\H\[\e[${defl}m\]:\[\e[${cyan}m\]\w\[\e[${yellow}m\$(my_write_git)\]"
else
  first_line="\u@\H:\w\$(my_write_git)"
fi

# Second line of the custom prompt: dynamically generated chevrons
chevron=">"
chevron_colors=("$magenta" "$red" "$yellow" "$green" "$cyan" "$blue")
chevron_string=""
for color in ${chevron_colors[@]}
do
  if [[ $(my_has_color) == 'true' ]]
  then
    chevron_string="$chevron_string\[\e[${color}m\]$chevron"
  else
    chevron_string="$chevron_string$chevron"
  fi
done
unset chevron color chevron_colors

# Second line of the custom prompt: put it together
if [[ $(my_has_color) == 'true' ]]
then
  second_line="\[\e[$defl;${bold}m\]$chevron_string\[\e[${reset}m\]"
else
  second_line="$chevron_string"
fi

# Set the prompt
PS1="$first_line\n$second_line "
unset black red yellow green cyan blue magenta white reset
unset git_line first_line second_line chevron_string

# Trim the prompt's working directory field (\w) down to two parents
PROMPT_DIRTRIM=2

##
# Custom paths
##

# Bash: custom directories for binaries
bin="$HOME/bin"
local_bin="$HOME/.local/bin"
[[ -d "$bin" ]] && export PATH="$bin:$PATH"
[[ -d "$local_bin" ]] && export PATH="$local_bin:$PATH"
unset bin local_bin

# Node.js: custom user directory for global binaries
npm_bin="$HOME/.local/share/npm_user/node_modules/.bin"
[[ -d "$npm_bin" ]] && export PATH="$npm_bin:$PATH"
unset npm_bin

#
# Coursier (Scala).
#
coursier_bin="$HOME/.local/share/coursier/bin"
[ -d "$coursier_bin" ] && export PATH="$coursier_bin:$PATH"
unset coursier_bin

#
# Gem (Ruby).
#
ruby_bin="$HOME/.local/share/gem/ruby/3.3.0/bin"
[ -d "$ruby_bin" ] && export PATH="$ruby_bin:$PATH"
unset ruby_bin

#
# Go.
#
go_bin="$HOME/.local/share/go"
[ -d "$go_bin" ] && export PATH="$go_bin:$PATH"
unset go_bin

#
# Julia.
#
julia_bin="$HOME/.juliaup/bin"
[ -d "$julia_bin" ] && export PATH="$julia_bin:$PATH"
unset julia_bin

##
# Miscellaneous
##

# File creation mask
# ==========
# uuu ggg ooo
# rwx rwx rwx
# ==========
# umask 022 ~> chmod go-w
# umask => u:000 g:010 o:010
# chmod => u:111 g:101 o:101 (go-w)
umask 022
```

## ~/.inputrc
```bash
Tab: menu-complete
"\e[Z": menu-complete-backward
set show-all-if-unmodified on
```

## ~/.dircolors
```bash
##########
# Configuration file for dircolors, a utility to help you set the
# LS_COLORS environment variable used by GNU ls with the --color option.
# Copyright (C) 1996-2019 Free Software Foundation, Inc.
# Copying and distribution of this file, with or without modification,
# are permitted provided the copyright notice and this notice are preserved.
##########

# The keywords COLOR, OPTIONS, and EIGHTBIT (honored by the
# slackware version of dircolors) are recognized but ignored.
# Below are TERM entries, which can be a glob patterns, to match
# against the TERM environment variable to determine if it is colorizable.
TERM Eterm
TERM ansi
TERM *color*
TERM con[0-9]*x[0-9]*
TERM cons25
TERM console
TERM cygwin
TERM dtterm
TERM gnome
TERM hurd
TERM jfbterm
TERM konsole
TERM kterm
TERM linux
TERM linux-c
TERM mlterm
TERM putty
TERM rxvt*
TERM screen*
TERM st
TERM terminator
TERM tmux*
TERM vt100
TERM xterm*
# Below are the color init strings for the basic file types.
# One can use codes for 256 or more colors supported by modern terminals.
# The default color codes use the capabilities of an 8 color terminal
# with some additional attributes as per the following codes:
# Attribute codes:
# 00=none 01=bold 04=underscore 05=blink 07=reverse 08=concealed
# Text color codes:
# 30=black 31=red 32=green 33=yellow 34=blue 35=magenta 36=cyan 37=white
# Background color codes:
# 40=black 41=red 42=green 43=yellow 44=blue 45=magenta 46=cyan 47=white
#NORMAL 00 # no color code at all
#FILE 00 # regular file: use no color at all
RESET 0 # reset to "normal" color
DIR 01;36 # directory
LINK 01;33 # symbolic link. (If you set this to 'target' instead of a
 # numerical value, the color is as for the file pointed to.)
MULTIHARDLINK 00 # regular file with more than one link
FIFO 40;33 # pipe
SOCK 01;35 # socket
DOOR 01;35 # door
BLK 40;33;01 # block device driver
CHR 40;33;01 # character device driver
ORPHAN 40;31;01 # symlink to nonexistent file, or non-stat'able file ...
MISSING 00 # ... and the files they point to
SETUID 37;41 # file that is setuid (u+s)
SETGID 30;43 # file that is setgid (g+s)
CAPABILITY 30;41 # file with capability
STICKY_OTHER_WRITABLE 01;36 # dir that is sticky and other-writable (+t,o+w)
OTHER_WRITABLE 01;36 # dir that is other-writable (o+w) and not sticky
STICKY 01;36 # dir with the sticky bit set (+t) and not other-writable
# This is for files with execute permission:
EXEC 01;32
# List any file extensions like '.gz' or '.tar' that you would like ls
# to colorize below. Put the extension, a space, and the color init string.
# (and any comments you want to add after a '#')
# If you use DOS-style suffixes, you may want to uncomment the following:
#.cmd 01;32 # executables (bright green)
#.exe 01;32
#.com 01;32
#.btm 01;32
#.bat 01;32
# Or if you want to colorize scripts even if they do not have the
# executable bit actually set.
#.sh 01;32
#.csh 01;32
 # archives or compressed (bright red)
.tar 01;31
.tgz 01;31
.arc 01;31
.arj 01;31
.taz 01;31
.lha 01;31
.lz4 01;31
.lzh 01;31
.lzma 01;31
.tlz 01;31
.txz 01;31
.tzo 01;31
.t7z 01;31
.zip 01;31
.z 01;31
.dz 01;31
.gz 01;31
.lrz 01;31
.lz 01;31
.lzo 01;31
.xz 01;31
.zst 01;31
.tzst 01;31
.bz2 01;31
.bz 01;31
.tbz 01;31
.tbz2 01;31
.tz 01;31
.deb 01;31
.rpm 01;31
.jar 01;31
.war 01;31
.ear 01;31
.sar 01;31
.rar 01;31
.alz 01;31
.ace 01;31
.zoo 01;31
.cpio 01;31
.7z 01;31
.rz 01;31
.cab 01;31
.wim 01;31
.swm 01;31
.dwm 01;31
.esd 01;31
# image formats
.jpg 01;35
.jpeg 01;35
.mjpg 01;35
.mjpeg 01;35
.gif 01;35
.bmp 01;35
.pbm 01;35
.pgm 01;35
.ppm 01;35
.tga 01;35
.xbm 01;35
.xpm 01;35
.tif 01;35
.tiff 01;35
.png 01;35
.svg 01;35
.svgz 01;35
.mng 01;35
.pcx 01;35
.mov 01;35
.mpg 01;35
.mpeg 01;35
.m2v 01;35
.mkv 01;35
.webm 01;35
.ogm 01;35
.mp4 01;35
.m4v 01;35
.mp4v 01;35
.vob 01;35
.qt 01;35
.nuv 01;35
.wmv 01;35
.asf 01;35
.rm 01;35
.rmvb 01;35
.flc 01;35
.avi 01;35
.fli 01;35
.flv 01;35
.gl 01;35
.dl 01;35
.xcf 01;35
.xwd 01;35
.yuv 01;35
.cgm 01;35
.emf 01;35
# https://wiki.xiph.org/MIME_Types_and_File_Extensions
.ogv 01;35
.ogx 01;35
# audio formats
.aac 00;36
.au 00;36
.flac 00;36
.m4a 00;36
.mid 00;36
.midi 00;36
.mka 00;36
.mp3 00;36
.mpc 00;36
.ogg 00;36
.ra 00;36
.wav 00;36
# https://wiki.xiph.org/MIME_Types_and_File_Extensions
.oga 00;36
.opus 00;36
.spx 00;36
.xspf 00;36
```
