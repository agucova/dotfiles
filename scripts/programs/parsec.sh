#!/usr/bin/env bash

which parsecd &> /dev/null
if [ $? -ne 0 ]; then
    echo "Installing: parsec..."
    TEMP_DEB="$(mktemp --suffix ".deb")" &&
    wget -q -O "$TEMP_DEB" 'https://builds.parsecgaming.com/package/parsec-linux.deb' > /dev/null && # Download .deb from RescueTime's website
    sudo apt-fast install -y "$TEMP_DEB" > /dev/null
    rm -f "$TEMP_DEB" > /dev/null
else
    echo "Already installed: parsec"
fi