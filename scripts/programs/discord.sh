#!/usr/bin/env bash

which discord &> /dev/null
if [ $? -ne 0 ]; then
    echo "Installing: discord..."
    TEMP_DEB="$(mktemp --suffix ".deb")" &&
    wget -q -O "$TEMP_DEB" 'https://discord.com/api/download?platform=linux&format=deb' > /dev/null && # Download .deb from Discord's website
    sudo apt-fast install -y "$TEMP_DEB" > /dev/null
    rm -f "$TEMP_DEB" > /dev/null
else
    echo "Already installed: discord"
fi