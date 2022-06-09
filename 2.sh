#!/bin/bash
mkdir ~/.ssh

ssh-keygen -t ed25519 -C "cmasucci@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519_github

git config --global user.email "cmasucci@gmail.com"
git config --global user.name "Chuck Masucci"

cat <<EOF >$HOME/.Xresources
Xft.dpi: 162
EOF

cat <<EOF >$HOME/.xinitrc
xrdb -merge ~/.Xresources
exec i3
EOF

cat <<EOF >$HOME/.ssh/config
Host github.com
  HostName github.com
  User cmasucci@gmail.com
  IdentityFile ~/.ssh/id_ed25519_github
  AddKeysToAgent yes
  IdentitiesOnly yes
EOF

git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

mkdir -p ~/.local/src
mkdir -p ~/.local/bin

#sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh)"
