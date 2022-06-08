#!/bin/bash

ssh-keygen -t ed25519 -C "cmasucci@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519_github

cat <<EOF >$HOME/.xinitrc
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

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

mkdir .local/src
mkdir .local/bin