source <(antibody init)
export ZSH="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"
export NVM_LAZY_LOAD=true

antibody bundle robbyrussell/oh-my-zsh
antibody bundle "
  robbyrussell/oh-my-zsh path:plugins/git
  robbyrussell/oh-my-zsh path:plugins/gpg-agent
  robbyrussell/oh-my-zsh path:plugins/command-not-found
  robbyrussell/oh-my-zsh path:plugins/fzf
  robbyrussell/oh-my-zsh path:plugins/ripgrep
"
antibody bundle zsh-users/zsh-syntax-highlighting
antibody bundle zsh-users/zsh-autosuggestions
antibody bundle lukechilds/zsh-nvm
antibody bundle romkatv/powerlevel10k

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs virtualenv)
DEFAULT_USER="$(whoami)"

alias vim=nvim
export VISUAL=nvim
export EDITR=nvim

export PATH="/home/kdryja/.pyenv/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export FZF_DEFAULT_COMMAND='fd'

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null
