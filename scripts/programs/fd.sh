#!/usr/bin/env bash
# Note: this is already included in apt.sh intentionally, it's to get the latest release and let it be updated automatically eventually

if test ! -f "/usr/bin/fd"; then
    echo "Installing: fd"
else
    echo "Updating: fd"
    sudo apt-get remove -y fd
fi

LATEST_RELEASE=$(curl -L -s -H 'Accept: application/json' https://github.com/sharkdp/fd/releases/latest)
LATEST_VERSION=$(echo $LATEST_RELEASE | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/')
ARTIFACT_URL="https://github.com/sharkdp/fd/releases/download/$LATEST_VERSION/fd_${LATEST_VERSION:1}_amd64.deb"

TEMP_DEB="$(mktemp --suffix ".deb")" &&
wget -q -O "$TEMP_DEB" "$ARTIFACT_URL" > /dev/null &&
sudo apt -qq install -y "$TEMP_DEB" 2>&1 >/dev/null | grep -v "does not have a stable"
rm -f "$TEMP_DEB" > /dev/null