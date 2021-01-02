#!/usr/bin/env bash

if [ $(dpkg-query -W -f='${Status}' spotify-client 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
    echo "Installing: spotify..."
    export APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1
    curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - > /dev/null 2>&1
    echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list > /dev/null
    sudo apt-get update > /dev/null
    sudo apt-fast install -y spotify-client > /dev/null
else
    echo "Already installed: spotify"
fi