# How to

- To find keyboard id: `evtest /dev/input/by-id/<device-id>`
- To install binary: `sudo ./download.sh`
- To install config: `sudo ./install.sh`
- To modify: edit `config.kbd` and reinstall
- To add/remove keyboard profiles, edit the files in the `./profile` directory

# References:

- Permission: https://github.com/kmonad/kmonad/blob/master/doc/faq.md#q-how-do-i-get-uinput-permissions
- Startup: https://github.com/kmonad/kmonad/tree/master/startup
- Systemd
