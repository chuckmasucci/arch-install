#!/bin/bash

mkdir -p $HOME/.local/src
mkdir -p $HOME/.local/bin
mkdir -p $HOME/.local/share/fonts
mkdir $HOME/.ssh

# -------------------------------------------------------------
# ssh
# -------------------------------------------------------------
ssh-keygen -t ed25519 -C "cmasucci@gmail.com"
eval "$(ssh-agent -s)"
ssh-add $HOME/.ssh/id_ed25519_github

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
# oh my zsh
# -------------------------------------------------------------
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

# -------------------------------------------------------------
# aur packages
# -------------------------------------------------------------
yay -S --noconfirm --needed barrier dmenu dunst firefox feh ffmpegthumbnailer fzf google-chrome htop lxappearance maim mimeo mpv nvidia-settings picom ranger redshift ripgrep rofi timeshift udiskie ulauncher unclutter w4m xboxdrv xclip xone-dkms yadm qbittorrent dracula-gtk-theme vimix-cursors noto-fonts-emoji xscreensaver hsetroot android-messages-desktop-bin google-chat-linix-bin noto-fonts noto-fonts-cjk spotify-launcher slack ttf-arimo-nerd noto-fonts noto-fonts-cjk xdotool xkblayout-state-git lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings paper-icon-theme

# -------------------------------------------------------------
# nerd fonts
# -------------------------------------------------------------
cd
git clone https://github.com/ronniedroid/getnf.git
cd getnf
./install.sh
$HOME/.local/bin/getnf

# -------------------------------------------------------------
# oh-my-zsh
# -------------------------------------------------------------
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# -------------------------------------------------------------
# yadm
# -------------------------------------------------------------
cd
yadm init
yadm remote add origin https://github.com/chuckmasucci/dotfiles.git
yadm fetch
yadm checkout origin/master -ft
yadm remote set-url origin git@github.com:chuckmasucci/dotfiles.git

# -------------------------------------------------------------
# nvidia settings
sudo cp $HOME/xorg.conf /etc/X11/
# -------------------------------------------------------------


python3 -m pip install --upgrade pip
python3 -m pip install --upgrade pillow
pip install Pint simpleeval parsedatetime pytz glances
