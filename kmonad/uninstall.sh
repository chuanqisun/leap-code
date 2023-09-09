#!/bin/bash

# Require sudo
[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"

STATUS="$(systemctl is-active kmonad.service)"
if [ "${STATUS}" = "active" ]; then
    systemctl stop kmonad.service
    systemctl daemon-reload
    echo "Stopped existing service"
fi

systemctl daemon-reload

rm -f /usr/bin/kmonad
rm -f /usr/bin/kmonad.sh

rm -f /etc/systemd/system/kmonad.service
rm -rf /etc/kmonad/