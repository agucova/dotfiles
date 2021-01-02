#!/usr/bin/env bash

if test ! -f "/usr/bin/micro"; then
    echo "Installing: micro..."
    curl -s https://getmic.ro | bash > /dev/null 2>&1
    sudo mv micro /usr/bin/ > /dev/null
else
    echo "Already installed: micro"
fi
