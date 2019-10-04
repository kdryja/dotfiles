#/usr/bin/sh

dir=$(dirname "$(realpath "$0")")

cp ~/.tmux.conf $dir
cp ~/.vimrc $dir
cp ~/.zprofile $dir
cp ~/.zshrc $dir
mkdir -p $dir/.config
cp -R ~/.config/kity $dir/.config
cp -R ~/.config/sway $dir/.config
cp -R ~/.config/waybar $dir/.config

