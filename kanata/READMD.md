# Kanata Configuration for Leap Code

This directory contains kanata configuration files for the Leap Code layout.

## Features

- **Right Alt as Layer Toggle**: Hold Right Alt to activate the second layer (leapmode) for special symbols and navigation
- **CapsLock Dual Function**: 
  - Tap (< 200ms): Escape
  - Hold: Left Control

## Profiles

- `generic-laptop.kbd`: Configuration for generic laptop keyboards (platform i8042 device)
- `ms-ergo.kbd`: Configuration for Microsoft Ergonomic keyboards

## Installation

1. Download the kanata binary:
   ```bash
   cd kanata
   ./download.sh
   ```

2. Install kanata as a systemd service:
   ```bash
   ./install.sh
   ```

This will:
- Create `uinput` group and add your user to it
- Copy the kanata binary to `/usr/bin/`
- Copy configuration files to `/etc/kanata/`
- Set up udev rules for uinput device access
- Enable and start the kanata systemd service

## Uninstallation

To remove kanata:
```bash
./uninstall.sh
```

## Configuration

The configuration files use kanata's s-expression syntax. Each profile includes:

- `defsrc`: Defines which keys kanata intercepts
- `deflayer qwerty`: The base QWERTY layer with dual-function keys
- `deflayer leapmode`: The special layer activated by holding Right Alt, containing:
  - Left hand: Common symbols for coding (-, $, {, }, [, ], _, etc.)
  - Right hand: Navigation (arrows, home, end, pgup, pgdn)

## Leapmode Layer Layout

When holding Right Alt:
```
_    _    -    (    )    >    pgup home up   end   _    _    _    _
_    -    $    {    }    =    pgdn left down right _    _    _    
_    _    [    ]    _    _    _    _     _   _     _    _
```

## Notes

- Kanata must be run with appropriate permissions to access input devices
- The systemd service runs kanata with Nice=-20 for better responsiveness
- Multiple keyboard profiles can run simultaneously
- Configuration auto-detection is enabled by default via `process-unmapped-keys yes`

## Troubleshooting

If kanata doesn't start:
1. Check service status: `systemctl status kanata.service`
2. View logs: `journalctl -u kanata.service -f`
3. Verify your keyboard device path with: `ls -l /dev/input/by-path/` or `ls -l /dev/input/by-id/`
4. Update the `linux-dev` path in the appropriate profile if needed

## More Information

- [Kanata GitHub Repository](https://github.com/jtroo/kanata)
- [Kanata Configuration Guide](https://github.com/jtroo/kanata/blob/main/docs/config.adoc)
