# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

# Store multi-line commands as a single command
shopt -s cmdhist

# See also: https://www.gnu.org/software/bash/manual/html_node/Aliases.html
shopt -s expand_aliases

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories
shopt -s globstar

# Append to the history file, don't overwrite it
shopt -s histappend

# Don't put duplicate lines or lines starting with space in the history
# See bash(1) for more options
HISTCONTROL=ignoreboth

# For setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTFILESIZE=2000
HISTSIZE=1000

# Colorizeed GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Colorized directory listings
[[ -f "$HOME/.dircolors" ]] && eval $(dircolors "$HOME/.dircolors")

# Enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc)
if [[ ! $(shopt -oq posix) ]]
then
  if [[ -f "/usr/share/bash-completion/bash_completion" ]]
  then
    source "/usr/share/bash-completion/bash_completion"
  elif [[ -f "/etc/bash_completion" ]]
  then
    source "/etc/bash_completion"
  fi
fi

# make less more friendly for non-text input files, see lesspipe(1)
[[ -x "/usr/bin/lesspipe" ]] && eval "$(SHELL=/bin/sh lesspipe)"

# File creation mask
# ==========
# uuu ggg ooo
# rwx rwx rwx
# ==========
# umask 022 ~> chmod go-w
# umask => u:000 g:010 o:010
# chmod => u:111 g:101 o:101 (go-w)
umask 022

# Display message on exit
function my_on_exit {
  printf "Bye.\n"
}

trap my_on_exit EXIT TERM HUP
