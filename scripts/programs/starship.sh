#!/usr/bin/env bash

which starship &> /dev/null
if [ $? -ne 0 ]; then
    echo "Installing: starship..."
    curl -fsSL https://starship.rs/install.sh | bash -s -- -y > /dev/null
    echo "starship init fish | source" > ~/.config/fish/config.fish
else
    echo "Already installed: starship"
fi