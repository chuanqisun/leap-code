#!/bin/bash

# Require sudo
[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"

./uninstall.sh

groupadd -f uinput
usermod -aG input $USER
usermod -aG uinput $USER

cp ./kmonad /usr/bin/kmonad
cp ./kmonad.sh /usr/bin/kmonad.sh

cp ./kmonad.rules /etc/udev/rules.d
modprobe uinput

cp ./kmonad.service /etc/systemd/system/kmonad.service
systemctl daemon-reload

mkdir -p /etc/kmonad
cp ./profiles/* /etc/kmonad/

systemctl try-restart kmonad.service
systemctl start kmonad.service
systemctl enable kmonad.service
