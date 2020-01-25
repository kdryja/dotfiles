#!/usr/bin/env bash
SKIP="%s is already installed, skipping...\n"
INSTALL="Installing %s\n"

if [[ ! -d ~/.tmux/plugins/tpm ]] 
then
  echo "Installing TPM (Tmux Plugin Manager)"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
  echo "TPM already installed, skipping"
fi

plugin="oh-my-zsh"
if [[ ! -d ~/.${plugin} ]]
then
  printf "$INSTALL" "$plugin"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  printf "$SKIP" "$plugin"
fi

plugin="Powerlevel9k"
if [[ ! -d ~/.oh-my-zsh/custom/themes/${plugin,,} ]]
then
  printf "$INSTALL" "$plugin"
  git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/${plugin}
else
  printf "$SKIP" "$plugin"
fi

plugin="zsh-nvm"
if [[ ! -d ~/.oh-my-zsh/custom/plugins/${plugin,,} ]]
then
  printf "$INSTALL" "$plugin"
  git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/${plugin}
  nvm install node
  nvm alias default node
  nvm use node
  npm install -g neovim
else
  printf "$SKIP" "$plugin"
fi

declare -A plugins=( \
  ["zsh-nvm"]="https://github.com/lukechilds/zsh-nvm"\
  ["zsh-syntax-highlighting"]="https://github.com/zsh-users/zsh-syntax-highlighting"\
  ["zsh-autosuggestions"]="https://github.com/zsh-users/zsh-autosuggestions" )

for i in "${!plugins[@]}"
do
  plugin_path="$HOME/.oh-my-zsh/custom/plugins/${i}"
  if [[ ! -d $plugin_path ]]
  then
    printf "$INSTALL" "$i"
    git clone ${plugins[$i]} $plugin_path 
    echo "Completed!"
  else
    printf "$SKIP" "$i"
  fi
done

if [[ ! -f ~/.local/share/nvim/site/autoload/plug.vim  ]]
then
  echo "Installing Vim-Plug"
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    else
      echo "Vim-Plug is already installed, skipping"
fi

if [[ ! -d ~/.pyenv ]]
then
  echo "Installing pyenv"
  curl https://pyenv.run | bash
  exec $SHELL
else
  echo "Pyenv is already installed."
fi

if [[ ! -d ~/.poetry ]]
then
  echo "Installing poetry"
  curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python
  exec $SHELL
else
  echo "Poetry is already installed."
fi

