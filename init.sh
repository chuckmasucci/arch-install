#!/bin/bash

mkdir -p ~/.local/src
mkdir -p ~/.local/bin
mkdir -p ~/.local/share/fonts

# -------------------------------------------------------------
# ssh
# -------------------------------------------------------------
mkdir ~/.ssh
ssh-keygen -t ed25519 -C "cmasucci@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519_github

cat <<EOF >$HOME/.ssh/config
Host github.com
  HostName github.com
  User cmasucci@gmail.com
  IdentityFile ~/.ssh/id_ed25519_github
  AddKeysToAgent yes
  IdentitiesOnly yes
EOF

# -------------------------------------------------------------
# yay
# -------------------------------------------------------------
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm

# -------------------------------------------------------------
# lunarvim
# -------------------------------------------------------------
LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)

# -------------------------------------------------------------
# oh-my-zsh
# -------------------------------------------------------------
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# -------------------------------------------------------------
# aur packages
# -------------------------------------------------------------
yay -S --noconfirm --needed - < aur_packages.txt

# -------------------------------------------------------------
# nerd fonts
# -------------------------------------------------------------
git clone https://github.com/ronniedroid/getnf.git
cd getnf
./install.sh
getnf

# -------------------------------------------------------------
# yadm
# -------------------------------------------------------------
yadm clone -f https://github.com/chuckmasucci/dotfiles.git

# -------------------------------------------------------------
# nvidia settings
# -------------------------------------------------------------
sudo cp /home/chuck/xorg.conf /etc/X11/