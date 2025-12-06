#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"
echo "Script in $SCRIPT_DIR"

# Require sudo
[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"

$SCRIPT_DIR/uninstall.sh

# Get the original user when running under sudo
REAL_USER=${SUDO_USER:-$USER}

groupadd -f uinput
usermod -aG input $REAL_USER
usermod -aG uinput $REAL_USER

cp $SCRIPT_DIR/kanata /usr/bin/kanata
cp $SCRIPT_DIR/kanata.sh /usr/bin/kanata.sh

cp $SCRIPT_DIR/kanata.rules /etc/udev/rules.d
modprobe uinput

cp $SCRIPT_DIR/kanata.service /etc/systemd/system/kanata.service
systemctl daemon-reload

mkdir -p /etc/kanata
cp $SCRIPT_DIR/profiles/* /etc/kanata/

systemctl try-restart kanata.service
systemctl start kanata.service
systemctl enable kanata.service
