#!/usr/bin/env bash

npm_path="$HOME/.local/share/npm_user"
mkdir -p "$npm_path"
npm config set prefix "$npm_path"
unset npm_path
