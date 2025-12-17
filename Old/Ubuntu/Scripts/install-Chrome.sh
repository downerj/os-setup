#!/usr/bin/env bash

# https://code.visualstudio.com/
FILE="chrome.deb"
URL="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"

#
# Download and install the file.
#
pushd /tmp
curl -L -o "$FILE" -R "$URL"
sudo dpkg -i "$FILE"
rm -f "$FILE"
popd
