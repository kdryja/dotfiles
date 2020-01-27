#!/usr/bin/env bash

if [[ ! -d ~/.tmux/plugins/tpm ]] 
then
  echo "Installing TPM (Tmux Plugin Manager)"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
  echo "TPM already installed, skipping"
fi

if [[ ! -d $HOME/.antigen ]]
then
  echo "Installing antigen"
  mkdir $HOME/.antigen
  curl -L git.io/antigen > $HOME/.antigen/antigen.zsh
  exec $SHELL

  # Install zsh-nvm
  nvm install node
  nvm alias default node
  nvm use node
  npm install -g neovim
else
  echo "Antigen is already installed"
fi

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

