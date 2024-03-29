#!/bin/bash

export EDITOR=nvim

pacman -S zsh neovim networkmanager sudo curl git bat openssh refind interception-tools interception-dual-function-keys base-devel tmux xorg xorg-server xorg-apps kitty imagemagick python-pygments nvidia nvidia-settings python python-pip xorg-xinit pulseaudio pavucontrol firefox unzip network-manager-applet hplip system-config-printer

ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
hwclock --systohc

timedatectl set-ntp true

refind-install

mkdir -p /etc/interception/dual-function-keys

cat <<EOF >/etc/locale.gen
en_US.UTF-8 UTF-8
EOF

cat <<EOF >/etc/hostname
arrakis
EOF

cat <<EOF >/etc/locale.conf
LANG=en_US.UTF-8
EOF

cat <<EOF >/etc/hosts
127.0.0.1	localhost
::1		localhost
192.168.1.60	arrakis
EOF

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

locale-gen

bash -c "$(curl -fsSL https://raw.githubusercontent.com/bobafetthotmail/refind-theme-regular/master/install.sh)"


# systemd
# NetworkManager
# udevmon
# cups





