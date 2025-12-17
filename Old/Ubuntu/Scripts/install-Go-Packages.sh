#!/usr/bin/env bash

go_path="$HOME/.local/share/go"
mkdir -p "$go_path"
go env -w GOPATH="$go_path"
unset go_path
