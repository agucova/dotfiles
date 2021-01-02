#!/usr/bin/env bash

if [ $(dpkg-query -W -f='${Status}' paper-icon-theme 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
    echo "Installing: paper-icon-theme..."
    TEMP_DEB="$(mktemp --suffix ".deb")" &&
    wget -q -O "$TEMP_DEB" 'https://launchpad.net/~snwh/+archive/ubuntu/ppa/+files/paper-icon-theme_1.5.723-201905252133~daily~ubuntu19.04.1_all.deb' > /dev/null && # Download .deb launchpad (no longer updated)
    sudo apt-fast install -y "$TEMP_DEB" > /dev/null
    rm -f "$TEMP_DEB" > /dev/null
else
    echo "Already installed: paper-icon-theme"
fi