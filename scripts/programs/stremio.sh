#!/usr/bin/env bash

if [ $(dpkg-query -W -f='${Status}' stremio 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
    echo "Installing: stremio..."
    TEMP_DEB="$(mktemp --suffix ".deb")" &&
    wget -q -O "$TEMP_DEB" 'https://dl.strem.io/shell-linux/v4.4.116/stremio_4.4.116-1_amd64.deb' > /dev/null && # Download .deb from Stremio's website, update periodically, tho the app seems to have an auto-update mechanism.
    sudo apt-fast install -y "$TEMP_DEB" > /dev/null
    rm -f "$TEMP_DEB" > /dev/null
else
    echo "Already installed: stremio"
fi