#/usr/bin/sh

dir=$(dirname "$(realpath "$0")")

cp ~/.tmux.conf $dir
cp ~/.vimrc $dir
cp ~/.zshrc $dir
cp ~/.vim-coc $dir
mkdir -p $dir/.config
cp -R ~/.config/kitty $dir/.config
cp -R ~/.config/sway $dir/.config
cp -R ~/.config/waybar $dir/.config

