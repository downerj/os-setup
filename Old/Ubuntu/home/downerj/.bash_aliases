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
  first_line="\[\e[$reset;${red}m\]\u\[\e[${reset}m\]@\[\e[${green}m\]\H\[\e[${reset}m\]:\[\e[${cyan}m\]\w\[\e[${yellow}m\$(my_write_git)\]"
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
  second_line="\[\e[${reset}m\]$chevron_string\[\e[${reset}m\]"
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
