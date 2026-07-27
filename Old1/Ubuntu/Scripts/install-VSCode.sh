#!/usr/bin/env bash

# https://code.visualstudio.com/
FILE="code.deb"
URL="https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"

#
# Download and install the file.
#
pushd /tmp
curl -L -o "$FILE" -R "$URL"
sudo dpkg -i "$FILE"
rm -f "$FILE"
popd
