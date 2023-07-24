groupadd -f uinput
usermod -aG input $USER
usermod -aG uinput $USER

cp ./kmonad.rules /etc/udev/rules.d
modprobe uinput

cp ./kmonad.service /etc/systemd/system/kmonad.service
systemctl daemon-reload

cp ./config.kbd /etc/kmonad/config.kbd
systemctl try-restart kmonad.service
systemctl start kmonad.service
systemctl enable kmonad.service
