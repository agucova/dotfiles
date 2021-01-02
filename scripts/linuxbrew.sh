#!/usr/bin/env bash

which brew &> /dev/null
if [ $? -ne 0 ]; then
    echo "Installing: linuxbrew."
    yes | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" > /dev/null
    brew update > /dev/null
    brew install -q gcc > /dev/null

else
    echo "Already installed: linuxbrew"
    brew update > /dev/null
fi

function binstall {
  if [ $(brew list | grep -c $1) -eq 0 ]; then
    echo "Installing: ${1}..."
    brew install -q $1 > /dev/null
  else
    echo "Already installed: ${1}"
  fi
}

binstall fzf
binstall mkcert