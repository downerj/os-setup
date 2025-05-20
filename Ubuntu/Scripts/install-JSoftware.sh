#!/usr/bin/env bash

# https://code.jsoftware.com/wiki/System/Installation
version=9.6
file="j${version}_linux64.tar.gz"
url="https://www.jsoftware.com/download/j$version/install/$file"
dir="j${version}_linux64"
share_dir="$HOME/.local/share"
icons_dir="$share_dir/icons/JSoftware"
apps_dir="$share_dir/applications"
bin_dir="/usr/bin"

#
# Download the file.
#
pushd /tmp
curl -L -O -R "$url"
tar -x -v -z -f "$file"
sudo "$dir/j$version/bin/install-usr.sh"
popd

#
# Copy the icons.
#
mkdir -p "$icons_dir/"
cp "$dir/j$version/bin/icons/"* "$icons_dir/"

#
# Create the desktop launcher.
#
cat << EOF > "$apps_dir/JConsole.desktop"
#!/usr/bin/env xdg-open

[Desktop Entry]
Version=1.0
Terminal=true
Type=Application
Name=J Console
Exec=$bin_dir/ijconsole
Icon=$icons_dir/jred.png
NoDisplay=false
Categories=Development;
EOF
