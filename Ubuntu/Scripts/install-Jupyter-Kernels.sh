#!/usr/bin/env bash

# Note: Make sure Jupyter is installed and each language's path setup script
# is run before this one.

kernels="$(jupyter --data-dir)/kernels"

#
# Go.
# https://github.com/gopherdata/gophernotes
#
go install github.com/gopherdata/gophernotes@v0.7.5
mkdir -p "$kernels/gophernotes"
pushd "$kernels/gophernotes"
cp "$(go env GOPATH)/pkg/mod/github.com/gopherdata/gophernotes@v0.7.5/kernel/*" ./
chmod +w kernel.json
sed "s|gophernotes|$(go env GOPATH)/bin/gophernotes|" < kernel.json.in > kernel.json
popd

#
# Java.
#

#
# Julia.
#

#
# Ruby.
#

#
# Scala.
#

#
# JavaScript & TypeScript.
#
#npm install --global \
#  ijavascript \
#  itypescript
#.local/share/npm_user/bin/ijsinstall --install=local

unset kernels

jupyter kernelspec list
