#!/usr/bin/env bash
set -e


echo "Welcome to the dotfiles update script!"
read -r -p "First things first, there are two sets of dotfiles. One for PCs running [w]ayland and one for [x]11. Which one would you like to use?: " response 
echo

case "$response" in
  "w")
    BASE="wayland"
    ;;
  "x")
    BASE="x11"
    ;;
  *)
    echo "Not recognized! Exiting now."
    exit 1
    ;;
esac

DIR=$(dirname "$(realpath "$0")")/$BASE
CONFIG=$BASE/.config
BASE_FILES=(
  ".tmux.conf"
  ".vimrc"
  ".zshrc"
  ".config/nvim"
  ".config/rofi"
  ".config/kitty"
  ".zprofile"
)
XORG_FILES=(".config/i3")
WAYLAND_FILES=(".config/sway" ".config/waybar")
case "$BASE" in
  "wayland")
    FILES=(${BASE_FILES[@]} ${WAYLAND_FILES[@]})
    ;;
  "x11")
    FILES=(${BASE_FILES[@]} ${XORG_FILES[@]})
    ;;
esac

read -r -p 'Would you like to update the git repo with local changes or rather update local dotfiles with the files pulled from repo? Take either [o]urs or [t]heirs: ' response 
echo
case "$response" in
  "o")
    for file in ${FILES[@]}; do
      if [[ -d $HOME/$file ]]
      then
        mkdir -p $DIR/$file
        cmd="cp -r $HOME/$file/* $DIR/$file/"
      else
        cmd="cp $HOME/$file $DIR/$file"
      fi
      echo "$cmd"
      $cmd
    done
    ;;
  "t")
    echo "This operation will overwrite local dotfiles with the remote."
    read -r -p "Are you sure? [y/N] " response
    case "$response" in
      [yY][eE][sS]|[yY]) 
        echo 'Proceeding.'
        echo
        for file in ${FILES[@]}; do
          if [[ -d $DIR/$file ]]
          then
            mkdir -p $HOME/$file
            cmd="cp -r $DIR/$file/* $HOME/$file/"
          else
            cmd="cp $DIR/$file $HOME/$file"
          fi
          echo "$cmd"
          $cmd
        done
        ;;
      *)
        echo 'Cancelled!'
        exit 1
        ;;
    esac
    ;;
  *)
    echo 'Not recognized, try either "ours" to update remote changes or "theirs" to update local changes'
    exit 1
    ;;
esac
