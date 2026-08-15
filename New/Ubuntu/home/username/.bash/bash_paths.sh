#!/usr/bin/env bash

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
