#!/usr/bin/env bash

if [ $(dpkg-query -W -f='${Status}' steam 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
    echo "Installing: steam..."
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        if [ $ID = "pop" ]; then
            echo "Pop_OS! Detected, installing Steam directly."
            sudo apt-fast -y install steam > /dev/null
        else
            sudo dpkg --add-architecture i386 > /dev/null
            sudo apt-fast -y install gdebi-core libgl1-mesa-dri:i386 libgl1-mesa-glx:i386
            sudo apt-fast -y install steam > /dev/null
        fi
    else
        echo "Failed to detect distro by using /etc/os-release"
    fi

else
    echo "Already installed: steam"
fi