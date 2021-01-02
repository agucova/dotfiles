#!/usr/bin/env bash

if [ $(dpkg-query -W -f='${Status}' lutris 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
    echo "Installing: lutris..."
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        if [ $ID = "pop" ]; then
            echo "Pop_OS! Detected, installing Lutris directly."
            sudo apt-fast -y install lutris > /dev/null
        else
            sudo add-apt-repository -y -u ppa:lutris-team/lutris > /dev/null
            sudo apt-fast -y install lutris > /dev/null
            sudo dpkg --add-architecture i386 > /dev/null
            sudo apt-fast -y install libgl1-mesa-dri:i386
            sudo apt-fast -y install mesa-vulkan-drivers mesa-vulkan-drivers:i386
        fi
    else
        echo "Failed to detect distro by using /etc/os-release"
    fi

else
    echo "Already installed: lutris"
fi