export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"


if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

plugins=(
        git
        golang
        docker
        zsh-autosuggestions
        zsh-syntax-highlighting
        multipass
        npm
        node
)

# ZSH Configs
export ZSH="$HOME/.oh-my-zsh"
export ZSH_COMPLETION="~/.oh-my-zsh/completions/"

ZSH_THEME="uc_custom"
source $ZSH/oh-my-zsh.sh

autoload -U compinit && compinit

# Go Configs
export GOPATH="$HOME/go"
export PATH=$PATH:$HOME/go/bin

# Personal Configs TODO: Merge into one file
source $HOME/dotfiles/alias
export PATH=$PATH:$HOME/Dotfiles/scripts

# History Configs
HISTSIZE=50000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups


# Misc Configs

#CMD: Raycast
export EDITOR=vim

#CMD: atuin or ctrl + r
# replacement for custom hst commanbd; https://github.com/atuinsh/atuin
source <(atuin gen-completions --shell zsh)
eval "$(atuin init zsh --disable-up-arrow)"
test -e $HOME/.iterm2_shell_integration.zsh && source $HOME/.iterm2_shell_integration.zsh || true

#CMD: glow  - markdown preview
source <(glow completion zsh)