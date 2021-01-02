#!/usr/bin/env bash

# Installer for snaps with containment
function sinstall {
  if [ $(snap list | grep -c $1) -eq 0 ]; then
    echo "Installing: ${1}..."
    sudo snap install $1 > /dev/null
  else
    echo "Already installed: ${1}"
  fi
}

# Installer for snaps without containment
function scinstall {
  if [ $(snap list | grep -c $1) -eq 0 ]; then
    echo "Installing: ${1}..."
    sudo snap install --classic $1 > /dev/null
  else
    echo "Already installed: ${1}"
  fi
}

# Installer for snaps without containment on edge channel.
function sceinstall {
  if [ $(snap list | grep -c $1) -eq 0 ]; then
    echo "Installing: ${1}..."
    sudo snap install --edge --classic $1 > /dev/null
  else
    echo "Already installed: ${1}"
  fi
}

# Installer for snaps without containment on beta channel and in devmode lol
function scbinstall {
  if [ $(snap list | grep -c $1) -eq 0 ]; then
    echo "Installing: ${1}..."
    sudo snap install --beta --devmode $1 > /dev/null
  else
    echo "Already installed: ${1}"
  fi
}


# Installer for snaps with containment on edge channel.
function seinstall {
  if [ $(snap list | grep -c $1) -eq 0 ]; then
    echo "Installing: ${1}..."
    sudo snap install --edge $1 > /dev/null
  else
    echo "Already installed: ${1}"
  fi
}


# Unconfined snaps
scinstall shotcut

# Unconfined edge
scbinstall anbox

# Confined snaps
sinstall glimpse-editor
sinstall musixmatch
sinstall foliate
# sinstall discord

# Confined edge
seinstall 1password
