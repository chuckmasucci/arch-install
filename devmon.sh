#!/bin/bash

sudo mkdir -p /etc/interception/dual-function-keys

sudo cat <<EOF >/etc/interception/udevmon.yaml
- JOB: "intercept -g \$DEVNODE | dual-function-keys -c /etc/interception/dual-function-keys/default.yaml | uinput -d \$DEVNODE"
  DEVICE:
    EVENTS:
      EV_KEY: [KEY_CAPSLOCK, KEY_ENTER]
EOF

sudo cat <<EOF >/etc/interception/dual-function-keys/default.yaml
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
