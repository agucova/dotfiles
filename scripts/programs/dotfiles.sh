#!/usr/bin/env bash

which dotfiles &> /dev/null
if [ $? -ne 0 ]; then
    echo "Installing: dotfiles..."
else
    echo "Updating: dotfiles..."
    sudo rm -f /usr/bin/dotfiles > /dev/null
fi

TEMP_BIN="$(mktemp --suffix ".zip")" &&
wget -q -O "$TEMP_BIN" 'https://github.com/rhysd/dotfiles/releases/download/v0.2.2/dotfiles_linux_amd64.zip' > /dev/null &&
unzip $TEMP_BIN -d . > /dev/null
sudo chmod +x dotfiles > /dev/null
sudo mv dotfiles /usr/bin/ > /dev/null
rm -f "$TEMP_BIN" > /dev/null