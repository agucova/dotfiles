#!/usr/bin/env bash

if test ! -f "$HOME/.local/share/omf/pkg/omf/functions/omf.fish"; then
   echo "Installing: oh-my-fish..."
   curl -L https://get.oh-my.fish > omf-installer.fish
   fish omf-installer.fish --noninteractive -y > /dev/null
   rm -f omf-installer.fish
else
   echo "Already installed: oh-my-fish"
fi