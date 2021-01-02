#!/usr/bin/env bash

if fc-list | grep -i "FiraCode Nerd Font" > /dev/null; then
    echo "Installing: Fira Code (Nerd)..."
    echo "Cloning repo, this make take a while."
    git clone --depth 1 https://github.com/ryanoasis/nerd-fonts > /dev/null
    bash nerd-fonts/install.sh "FiraCode" > /dev/null
else
    echo "Already installed: Fira Code Nerd Font"
fi