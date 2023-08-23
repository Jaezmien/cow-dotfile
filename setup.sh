#!/bin/bash

if [[ $UID != 0 ]]; then
	echo "Run this script with sudo!"
	exit 1
fi

USER_HOME=$(eval echo ~${SUDO_USER})
cd $USER_HOME

# -- Upgrade & Update distro -- #
sudo apt update
sudo apt upgrade

# -- Install important ones first -- #
sudo apt install git wget unzip -y

# -- Setup folders -- #
mkdir $USER_HOME/.local
mkdir $USER_HOME/.local/bin
mkdir $USER_HOME/.local/share
mkdir $USER_HOME/.local/share/fonts
mkdir $USER_HOME/.config
mkdir $USER_HOME/.icons

# -- zsh -- #
chsh -s $(which zsh) # Set default shell to .zsh
mkdir $USER_HOME/.zsh
ln -s $PWD/.zshrc $USER_HOME/.zshrc # config

# -- Install zsh plugins -- #
mkdir $USER_HOME/.zsh/plugins
git clone https://github.com/catppuccin/zsh-syntax-highlighting.git $USER_HOME/.zsh/plugins/syntax-catppuccin
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $USER_HOME/.zsh/plugins/syntax

# -- Desktop -- #
ln -s $PWD/config/i3 $USER_HOME/.config/
ln -s $PWD/config/polybar $USER_HOME/.config/

# -- Lockscreen -- #
ln -s $PWD/scripts/lock.sh $USER_HOME/.local/bin/
ln -s $PWD/scripts/suspend.sh $USER_HOME/.local/bin/
ln -s $PWD/assets/shy.png $USER_HOME/.local/share/

# -- Wallpapers -- #
mkdir $USER_HOME/.local/share/wallpapers
wget https://derpicdn.net/img/download/2020/2/5/2266546.png -O $USER_HOME/.local/share/wallpaper.png
ln -s $PWD/scripts/wallpaper.sh $USER_HOME/.local/bin/

# -- Fluttershy cursor -- #
ln -s $PWD/cursor $USER_HOME/.icons/default
ln -s $PWD/config/gtk-3.0 $USER_HOME/.config/

# -- Noto Sans Nerd Font -- #
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Noto.zip -O Noto.zip
unzip Noto.zip -d $USER_HOME/.local/share/fonts/NotoSerifNerdFont
rm Noto.zip

# -- Kitty  -- #
ln -s $PWD/config/kitty $USER_HOME/.config/

# -- Qutebrowser -- #
mkdir $USER_HOME/.config/qutebrowser
ln -s $PWD/config/qutebrowser/autoconfig.yml $USER_HOME/.config/qutebrowser/
ln -s $PWD/config/qutebrowser/config.py $USER_HOME/.config/qutebrowser/
