#!/usr/bin/env bash
echo "Setting up apt environment for installation."
sudo apt-get update -y > /dev/null

if [ $(dpkg-query -W -f='${Status}' apt-fast 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
  echo "Installing: apt-fast..."
  sudo apt-get -y install apt-transport-https curl > /dev/null
  sudo add-apt-repository ppa:apt-fast/stable -y > /dev/null
  sudo apt-get -y install apt-fast > /dev/null
else
  echo "Already installed: apt-fast..."
fi

echo "Initiating system upgrade, this may take a while"
sudo apt-fast upgrade -y
printf "\033c"
echo "System update finished"

function install {
  if [ $(dpkg-query -W -f='${Status}' $1 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
    echo "Installing: ${1}..."
    sudo apt-fast install -y $1 > /dev/null
  else
    echo "Already installed: ${1}"
  fi
}

# Basics
install snapd
install fish
install python3
install python3-pip
install build-essential
install byobu
install git
install curl
install exfat-utils
install file
install htop
install nmap
install aria2
install golang
install unzip
install bat

# Programming
install clang-format
install gnome-boxes
install autoconf-archive
install autogen
install automake
install cmake
install libjson-c-dev
install libjudy-dev
install liblz4-dev l
install libsdl2-dev
install playonlinux
install nodejs
install npm

# Image, sound and video processing
install gimp
install jpegoptim
install optipng
install inkscape
install imagemagick
install pavucontrol
install ffmpeg
install vlc
install gnome-mpv

# Miscellaneous
install calibre
install caffeine
install filezilla
install neofetch
install transmission
install gnome-boxes
install gnome-tweaks

# Fun stuff
install figlet
install lolcat
install cowsay
