groupadd -f uinput
usermod -aG input $USER
usermod -aG uinput $USER
cp kmonad.rules /etc/udev/rules.d
modprobe uinput
cp kmonad.service /etc/systemd/system/kmonad.service
systemd daemon-reload
cp config.kdb /etc/kmonad/config.kbd