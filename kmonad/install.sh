#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"
echo "Script in $SCRIPT_DIR"

# Require sudo
[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"

$SCRIPT_DIR/uninstall.sh

groupadd -f uinput
usermod -aG input $USER
usermod -aG uinput $USER

cp $SCRIPT_DIR/kmonad /usr/bin/kmonad
cp $SCRIPT_DIR/kmonad.sh /usr/bin/kmonad.sh

cp $SCRIPT_DIR/kmonad.rules /etc/udev/rules.d
modprobe uinput

cp $SCRIPT_DIR/kmonad.service /etc/systemd/system/kmonad.service
systemctl daemon-reload

mkdir -p /etc/kmonad
cp $SCRIPT_DIR/profiles/* /etc/kmonad/

systemctl try-restart kmonad.service
systemctl start kmonad.service
systemctl enable kmonad.service
