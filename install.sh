sudo pacman -S zsh neovim networkmanager sudo curl git bat interception-tools interception-dual-function-keys base-devel tmux xorg xorg-server xorg-apps kitty imagemagick python-pygments nvidia python python-pip xorg-xinit

export EDITOR=nvim

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/bobafetthotmail/refind-theme-regular/master/install.sh)"

git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

cp ./files/udevmon.yaml /etc/interception
mkdir /etc/interception/dual-function-keys
cp ./files/default.yaml /etc/interception/dual-function-keys
systemctl enable --now udevmon
systemctl status udevmon
