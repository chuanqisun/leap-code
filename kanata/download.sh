#!/bin/bash

# Download the latest kanata binary for Linux x64
# Note: This downloads the zipped binaries from the latest release
# For production use, verify checksums from: https://github.com/jtroo/kanata/releases/latest

KANATA_VERSION="v1.10.0"
DOWNLOAD_URL="https://github.com/jtroo/kanata/releases/download/${KANATA_VERSION}/linux-binaries-x64-${KANATA_VERSION}.zip"
CHECKSUM="fe6ba3768c1a7a60d94628a613f168f464b7ab88d34077e26896a7d3967e5eb6"

echo "Downloading kanata ${KANATA_VERSION}..."
wget -q --show-progress "${DOWNLOAD_URL}" -O kanata.zip

echo "Verifying checksum..."
echo "${CHECKSUM}  kanata.zip" | sha256sum -c - || {
    echo "Checksum verification failed!"
    rm -f kanata.zip
    exit 1
}

echo "Extracting binary..."
unzip -q kanata.zip
# The zip contains multiple binaries, we'll use the basic one
mv kanata ./kanata 2>/dev/null || mv kanata_linux_x64 ./kanata 2>/dev/null || {
    echo "Could not find kanata binary in archive"
    ls -la
    exit 1
}

chmod +x ./kanata
rm -f kanata.zip

echo "kanata binary downloaded and ready!"
./kanata --version
