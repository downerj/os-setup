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
cp "$(go env GOPATH)/pkg/mod/github.com/gopherdata/gophernotes@v0.7.5/kernel/"* ./
chmod +w kernel.json
sed "s|gophernotes|$(go env GOPATH)/bin/gophernotes|" < kernel.json.in > kernel.json
popd

#
# Java.
# https://github.com/SpencerPark/IJava
#
ijava_path="$HOME/.local/share/ijava"
ijava_version="1.3.0"
ijava_file="ijava-$ijava_version.zip"
mkdir -p "$ijava_path"
pushd "$ijava_path"
curl -f -L -O -R -s -S "https://github.com/SpencerPark/IJava/releases/download/v$ijava_version/$ijava_file"
unzip "$ijava_file"
rm -f -v "$ijava_file"
python3 install.py --user
popd
unset ijava_path ijava_version ijava_file

#
# Julia.
# https://github.com/JuliaLang/IJulia.jl
#
julia -e 'using Pkg; Pkg.add("IJulia")'

#
# Ruby.
# https://github.com/SciRuby/iruby
#
gem install --user-install iruby
iruby register --force

#
# Scala.
# https://almond.sh/docs/quick-start-install
#
coursier launch --use-bootstrap almond -- --install

#
# JavaScript & TypeScript.
#
#npm install --global \
#  ijavascript \
#  itypescript
#.local/share/npm_user/bin/ijsinstall --install=local

unset kernels

jupyter kernelspec list
