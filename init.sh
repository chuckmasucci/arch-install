#!/bin/bash

mkdir -p ~/.local/src
mkdir -p ~/.local/bin
mkdir -p ~/.local/share/fonts

# -------------------------------------------------------------
# ssh
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
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

# -------------------------------------------------------------

# nerd fonts
git clone https://github.com/ronniedroid/getnf.git
cd getnf
./install.sh
getnf

# -------------------------------------------------------------
# oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# -------------------------------------------------------------
# yadm
yadm clone -f https://github.com/chuckmasucci/dotfiles.git
