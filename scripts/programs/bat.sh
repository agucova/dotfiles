#!/usr/bin/env bash
# Note: this is already included in apt.sh intentionally, it's to get the latest release and let it be updated automatically eventually

if test ! -f "/usr/bin/bat"; then
    echo "Installing: bat"
else
    echo "Updating: bat"
    sudo apt-get remove -y bat > /dev/null
fi

LATEST_RELEASE=$(curl -L -s -H 'Accept: application/json' https://github.com/sharkdp/bat/releases/latest)
LATEST_VERSION=$(echo $LATEST_RELEASE | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/')
ARTIFACT_URL="https://github.com/sharkdp/bat/releases/download/$LATEST_VERSION/bat_${LATEST_VERSION:1}_amd64.deb"

TEMP_DEB="$(sudo mktemp --suffix ".deb")" &&
sudo wget -q -O "$TEMP_DEB" "$ARTIFACT_URL" > /dev/null &&
sudo apt -qq install -y "$TEMP_DEB" 2>&1 >/dev/null | grep -v "does not have a stable"
sudo rm -f "$TEMP_DEB" > /dev/nulls