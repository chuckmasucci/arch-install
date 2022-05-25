sudo pacman -S zsh neovim networkmanager sudo curl git bat interception-tools interception-dual-function-keys ranger base-devel

export EDITOR=nvim

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/bobafetthotmail/refind-theme-regular/master/install.sh)"

git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

sudo cp ./files/udevmon.yaml /etc/interception
sudo mkdir /etc/interception/dual-function-keys
sudo cp ./files/default.yaml /etc/interception/dual-function-keys
sudo systemctl enable --now udevmon
sudo systemctl status udevmon
