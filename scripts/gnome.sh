#!/usr/bin/env bash
if test ! -f "/usr/bin/gnomep/"; then
    echo "Installing: GNOME Extensions helper."
else
    echo "Updating: GNOME Extensions helper"
    rm -f "/usr/bin/gnomep" > /dev/null
fi

sudo wget -q "https://raw.githubusercontent.com/NicolasBernaerts/ubuntu-scripts/master/ubuntugnome/gnomeshell-extension-manage" -O /usr/bin/gnomep > /dev/null
sudo chmod +x /usr/bin/gnomep

function ginstall {
  if [ $(ls $HOME/.local/share/gnome-shell/extensions/ | grep -c $1) -eq 0 ]; then
    echo "Installing: ${1}..."
    /usr/bin/gnomep --install --extension-id "$1" > /dev/null
  else
    echo "Already installed: ${1}"
  fi
}

# ginstall cpufreq
# ginstall dash-to-dock
# ginstall emoji-selector
# ginstall freon