#!/usr/bin/env bash

which insync &> /dev/null
if [ $? -ne 0 ]; then
    echo "Installing: insync..."
    TEMP_DEB="$(mktemp --suffix ".deb")" &&
    wget -q -O "$TEMP_DEB" 'https://d2t3ff60b2tol4.cloudfront.net/builds/insync_3.2.5.40859-focal_amd64.deb' > /dev/null && # Possible outdated, but repo is added automatically
    sudo apt-fast install -y "$TEMP_DEB" > /dev/null
    rm -f "$TEMP_DEB" > /dev/null
else
    echo "Already installed: insync"
fi