#!/bin/bash
#
# -------------------------------------------------------------
# nopasswd for user
# -------------------------------------------------------------
# TODO: cat NOPASSWD:ALL to end of /etc/sudoers.d/00_chuck

# -------------------------------------------------------------
# hosts
# -------------------------------------------------------------
cat <<EOF >/etc/hosts
127.0.0.1	localhost
::1		localhost
192.168.1.60	arrakis
192.168.1.70	frmac
EOF

# -------------------------------------------------------------
# refind
# -------------------------------------------------------------
refind-install
bash -c "$(curl -fsSL https://raw.githubusercontent.com/bobafetthotmail/refind-theme-regular/master/install.sh)"

# -------------------------------------------------------------
# udevmon
# -------------------------------------------------------------
mkdir -p /etc/interception/dual-function-keys

cat <<EOF >/etc/interception/udevmon.yaml
- JOB: "intercept -g \$DEVNODE | dual-function-keys -c /etc/interception/dual-function-keys/default.yaml | uinput -d \$DEVNODE"
  DEVICE:
    EVENTS:
      EV_KEY: [KEY_CAPSLOCK, KEY_ENTER]
EOF

cat <<EOF >/etc/interception/dual-function-keys/default.yaml
TIMING:
  TAP_MILLISEC: 200
  DOUBLE_TAP_MILLISEC: 150

MAPPINGS:
  - KEY: KEY_ENTER
    TAP: KEY_ENTER
    HOLD: KEY_RIGHTCTRL
  - KEY: KEY_CAPSLOCK
    TAP: KEY_ESC
    HOLD: KEY_LEFTCTRL
EOF

systemctl enable --now udevmon.service
systemctl enable --now cups.service
