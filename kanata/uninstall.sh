#!/bin/bash

# Require sudo
[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"

STATUS="$(systemctl is-active kanata.service)"
if [ "${STATUS}" = "active" ]; then
    systemctl stop kanata.service
    systemctl daemon-reload
    echo "Stopped existing service"
fi

systemctl daemon-reload

rm -f /usr/bin/kanata
rm -f /usr/bin/kanata.sh

rm -f /etc/systemd/system/kanata.service
rm -rf /etc/kanata/
