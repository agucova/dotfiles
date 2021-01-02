#!/usr/bin/env bash

if [ $(dpkg-query -W -f='${Status}' zoom 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
    echo "Installing: zoom..."
    TEMP_DEB="$(mktemp --suffix ".deb")" &&
    wget -q -O "$TEMP_DEB" 'https://zoom.us/client/latest/zoom_amd64.deb' > /dev/null && # Download .deb from Zoom's website
    sudo apt-fast install -y "$TEMP_DEB" > /dev/null
    rm -f "$TEMP_DEB" > /dev/null
else
    echo "Already installed: zoom"
fi