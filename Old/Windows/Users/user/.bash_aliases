#!/usr/bin/env bash

# This file contains user-defined aliases, bash settings, etc.

[ -f "$HOME/.bash_paths" ] && source "$HOME/.bash_paths"

# Set file creation mask.
# Example: umask 022 means chmod go-w.
umask 022

# Store multi-line commands as a single command.
shopt -s cmdhist

# Check the window size after each command, and update the values of LINES and COLUMNS.
shopt -s checkwinsize

shopt -s expand_aliases

# Query on copy and move overwrites as well as deletion, and set verbose output.
alias cp="/usr/bin/env cp -i -v"
alias mv="/usr/bin/env mv -i -v"
alias rm="/usr/bin/env rm -i -v"
alias rmdir="/usr/bin/env rmdir -v"
alias cp_="/usr/bin/env cp"
alias mv_="/usr/bin/env mv"
alias rm_="/usr/bin/env rm"
alias rmdir_="/usr/bin/env rmdir"

# Use human-readable file sizes when checking free space and disk sizes.
alias df="/usr/bin/env df -h"
alias du="/usr/bin/env du -h"
alias df_="/usr/bin/env df"
alias du_="/usr/bin/env du"

# Colorize listings, list by lines, append indicators and group folders first.
alias ls="/usr/bin/env ls -Fx --color=auto --group-directories-first"
alias ls_="/usr/bin/env ls"

case "$TERM" in
  xterm-color|*-256color) color_prompt=yes;;
esac

black="30"
red="31"
yellow="33"
green="32"
cyan="36"
blue="34"
magenta="35"
white="37"
reset="0"
bold="1"

git_line='`[[ -n "$use_git" ]] && git branch 2>/dev/null | grep -e ^* | sed -E s/\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
if [ $color_prompt = "yes" ]; then
  first_line="\[\e[$reset;$bold;${red}m\]bash \[\e[${yellow}m\]\u \[\e[${blue}m\]\H \[\e[${cyan}m\]\w \[\e[${green}m\]$git_line"
else
  first_line="bash \u \H \w $git_line"
fi

#chevron=$(echo -e "\u276f")
chevron=">"
chevron_colors=("$magenta" "$red" "$yellow" "$green" "$cyan" "$blue")
chevron_str=""
for color in ${chevron_colors[@]}; do
  if [ $color_prompt = "yes" ]; then
    chevron_str="$chevron_str\[\e[${color}m\]$chevron"
  else
    chevron_str="$chevron_str$chevron"
  fi
done

if [ $color_prompt = "yes" ]; then
  second_line="\[\e[$reset;${bold}m\]$chevron_str\[\e[${reset}m\]"
else
  second_line="$chevron_str"
fi

PS1="$first_line\n$second_line "
PROMPT_DIRTRIM=2

unset black red yellow green cyan blue magneta white reset bold color
unset git_line first_line second_line chevron chevron_colors chevron_str
