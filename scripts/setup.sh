#!/usr/bin/env bash

echo "Initiating setup, remember to run from scripts/."

# Install universe apt packages
./apt.sh

# Install snap packages
./snap.sh

# Install external programs
for f in programs/*.sh; do
  bash "$f" -H
done

# Install GNOME Extensions
./gnome.sh

# Install Python modules and tools
./python.sh

# Install VSCode Extensions - Now covered by settings sync
# ./code.sh

# Add apps to favorite bar in GNOME
gsettings set org.gnome.shell favorite-apps "['org.gnome.Nautilus.desktop', 'brave-browser.desktop', 'spotify_spotify.desktop', 'code_code.desktop', 'alacritty_alacritty.desktop']"
