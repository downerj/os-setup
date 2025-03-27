#!/usr/bin/env bash

# https://code.visualstudio.com/
FILE="code_1.98.2-1741788907_amd64.deb"
URL="https://vscode.download.prss.microsoft.com/dbazure/download/stable/ddc367ed5c8936efe395cffeec279b04ffd7db78/$FILE"

#
# Download and install the file.
#
pushd /tmp
curl -L -O -R "$URL"
sudo dpkg -i "$FILE"
rm -f "$FILE"
popd
