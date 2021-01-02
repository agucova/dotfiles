#!/usr/bin/env bash

which tldr &> /dev/null
if [ $? -ne 0 ]; then
    echo "Installing: tldr..."
    sudo npm_config_loglevel=silent npm install -g tldr > /dev/null
else
    echo "Already installed: tldr"
fi