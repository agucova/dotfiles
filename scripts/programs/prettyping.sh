#!/usr/bin/env bash

if test ! -f "/usr/bin/prettyping"; then
    echo "Installing: prettyping..."
    sudo wget -q "https://raw.githubusercontent.com/denilsonsa/prettyping/master/prettyping" -O /usr/bin/prettyping > /dev/null
    sudo chmod +x /usr/bin/prettyping
else
    echo "Already installed: prettyping"
fi