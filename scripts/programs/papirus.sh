#!/usr/bin/env bash

if [ $(dpkg-query -W -f='${Status}' papirus-icon-theme 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
    echo "Installing: papirus-icon-theme..."
    sudo add-apt-repository -y -u ppa:papirus/papirus > /dev/null
    sudo apt-fast -y install papirus-icon-theme > /dev/null
else
    echo "Already installed: papirus-icon-theme"
fi