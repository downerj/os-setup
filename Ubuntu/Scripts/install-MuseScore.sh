#!/usr/bin/env bash

# https://musescore.org/en/download
VERSION="4.5.1"
HASH="250800846"
FILE="MuseScore-Studio-${VERSION}.${HASH}-x86_64.AppImage"
URL="https://cdn.jsdelivr.net/musescore/v$VERSION/$FILE"
SHARE_DIR="$HOME/.local/share"
APPS_DIR="$SHARE_DIR/applications"

#
# Download the file.
#
pushd /tmp
curl -L -O -R "$URL"
chmod +x "$FILE"
mkdir -p "$SHARE_DIR/MuseScore"
mv "$FILE" "$SHARE_DIR/MuseScore/MuseScore-Studio.AppImage"
popd

#
# Extract the icon.
#
mkdir -p "$SHARE_DIR/icons"
pushd "$SHARE_DIR/MuseScore/"
./MuseScore-Studio.AppImage --appimage-mount > /tmp/mount-location.txt &
APPIMAGE_PID=$!
MOUNT_DIR=$(cat /tmp/mount-location.txt)
cp "$MOUNT_DIR/share/icons/hicolor/128x128/apps/mscore4portable.png" "$SHARE_DIR/icons/"
kill -HUP $APPIMAGE_PID
rm -f /tmp/mount-location.txt
popd

#
# Create the desktop launcher.
#
cat << EOF > "$APPS_DIR/MuseScore-Studio.desktop"
#!/usr/bin/env xdg-open

[Desktop Entry]
Version=1.0
Terminal=false
Type=Application
Name=MuseScore Studio
Exec=$SHARE_DIR/MuseScore/MuseScore-Studio.AppImage
Icon=$SHARE_DIR/icons/mscore4portable.png
NoDisplay=false
Categories=Audio;
EOF
