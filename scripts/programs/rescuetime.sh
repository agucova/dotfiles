#!/usr/bin/env bash

which rescuetime &> /dev/null
if [ $? -ne 0 ]; then
    echo "Installing: rescuetime..."
    TEMP_DEB="$(mktemp --suffix ".deb")" &&
    wget -q -O "$TEMP_DEB" 'https://www.rescuetime.com/installers/rescuetime_current_amd64.deb' > /dev/null && # Download .deb from RescueTime's website
    sudo apt-fast install -y "$TEMP_DEB" > /dev/null
    rm -f "$TEMP_DEB" > /dev/null
else
    echo "Already installed: rescuetime"
fi