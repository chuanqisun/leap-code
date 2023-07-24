# Uinput permissions


1. Set up user and group
```bash
sudo groupadd -f uinput
sudo usermod -aG input $USER
sudo usermod -aG uinput $USER
```
2. logout and login
3. copy `kmonad.rules` to `/etc/udev/rules.d`
4. `sudo modprobe uinput`
5. copy `kmonad.service` to `/etc/systemd/system/kmonad.service`
6. copy `config.kdb` to `/etc/kmonad/config.kbd`