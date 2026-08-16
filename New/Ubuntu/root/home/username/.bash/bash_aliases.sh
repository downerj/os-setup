#!/usr/bin/env bash

##
# Command aliases
# To get the original command, use `command` or `/usr/bin/env`, e.g.:
# command ls
# /usr/bin/env ls
# ==========
# See also: https://tldp.org/LDP/abs/html/aliases.html
##

# Force grep to use colored output
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Use human-readable file sizes (-h) when checking free space and disk sizes
alias df="df -h"
alias du="du -h"

# Listing aliases
#alias ll='ls -a -l -F'
#alias la='ls -A'
#alias l='ls -C -F'

# Colorize directory listings (--color=auto), list by lines (-x), append indicators (-F)
# and group folder first (--group-directories-first)
alias ls="ls -F -x --color=auto --group-directories-first"

# Safe move overwrite, remove, copy overwrite
alias cp='cp --interactive --verbose'
alias mv='mv --interactive --verbose'
alias rm='rm --interactive --verbose'
alias rmdir='rmdir --verbose'
