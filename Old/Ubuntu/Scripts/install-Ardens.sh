#!/usr/bin/env bash

# https://github.com/tiberiusbrown/Ardens/releases
VERSION="0.24.12"
FILE="Ardens_linux_x64.zip"
URL="https://github.com/tiberiusbrown/Ardens/releases/download/v$VERSION/$FILE"
SHARE_DIR="$HOME/.local/share"
APPS_DIR="$SHARE_DIR/applications"

#
# Download and extract the files.
#
pushd /tmp
curl -L -O -R "$URL"
mkdir -p "$SHARE_DIR/"
unzip -d Ardens "$FILE"
chmod +x Ardens/*.AppImage
mv Ardens "$SHARE_DIR/"
rm -f "$FILE"
popd

#
# Extract the icon.
#
mkdir -p "$SHARE_DIR/icons"
pushd "$SHARE_DIR/Ardens/"
./Ardens-x86_64.AppImage --appimage-mount > /tmp/mount-location.txt &
APPIMAGE_PID=$!
MOUNT_DIR=$(cat /tmp/mount-location.txt)
cp "$MOUNT_DIR/ardens.png" "$SHARE_DIR/icons/"
kill -HUP $APPIMAGE_PID
rm -f /tmp/mount-location.txt
popd

#
# Create the desktop launchers.
#
cat << EOF > "$APPS_DIR/Ardens.desktop"
#!/usr/bin/env xdg-open

[Desktop Entry]
Version=1.0
Terminal=false
Type=Application
Name=Ardens
Exec=$SHARE_DIR/Ardens/Ardens-x86_64.AppImage
Icon=$SHARE_DIR/icons/ardens.png
NoDisplay=false
Categories=Development;Game;
EOF

cat << EOF > "$APPS_DIR/Ardens-Player.desktop"
#!/usr/bin/env xdg-open

[Desktop Entry]
Version=1.0
Terminal=false
Type=Application
Name=Ardens Player
Exec=$SHARE_DIR/Ardens/ArdensPlayer-x86_64.AppImage
Icon=$SHARE_DIR/icons/ardens.png
NoDisplay=false
Categories=Development;Game;
EOF
