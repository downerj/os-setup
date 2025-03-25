#!/usr/bin/env bash

VERSION="2.1.4"
FILE="TeXmacs-${VERSION}-C.tar.gz"
URL="https://www.texmacs.org/Download/ftp/tmftp/generic/${FILE}"
DIR="TeXmacs-${VERSION}-x86_64-pc-linux-gnu"
SHARE_DIR="${HOME}/.local/share"
APPS_DIR="${SHARE_DIR}/applications"

pushd /tmp
curl -L -O -R "${URL}"
tar -x -v -z -f "${FILE}"
rm -f "${FILE}"
mv "${DIR}/TeXmacs" "${SHARE_DIR}/"
rmdir "${DIR}"
popd

cat << EOF > "${SHARE_DIR}/TeXmacs/bin/TeXmacs.sh"
#!/usr/bin/env bash

export TEXMACS_PATH="${SHARE_DIR}/TeXmacs"
export PATH="\${TEXMACS_PATH}/bin:\${PATH}"
\${TEXMACS_PATH}/bin/texmacs &
EOF

chmod +x "${SHARE_DIR}/TeXmacs/bin/TeXmacs.sh"

cat << EOF > "${APPS_DIR}/TeXmacs.desktop"
#!/usr/bin/env xdg-open

[Desktop Entry]
Version=1.0
Terminal=false
Type=Application
Name=TeXmacs
Exec=${SHARE_DIR}/TeXmacs/bin/TeXmacs.sh
Icon=${SHARE_DIR}/TeXmacs/misc/images/texmacs-512.png
NoDisplay=false
Categories=Education;
EOF
