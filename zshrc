ZSH_ROOT=$HOME/.zsh-benschw
source $ZSH_ROOT/antigen/antigen.zsh

antigen-use oh-my-zsh

#antigen bundle sorin-ionescu/prezto

antigen-bundle git
antigen-bundle vagrant
antigen-bundle zsh-users/zsh-syntax-highlighting
antigen-bundle zsh-users/zsh-history-substring-search

antigen theme $ZSH_ROOT/themes/foo foo

antigen-apply

# Source Prezto.
#if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
#  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
#fi

# Customize to your needs...

export GOROOT=/opt/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin

eval `dircolors $HOME/.vim/dircolors.custom`

export EDITOR='vim'
export EDITOR='vim'
export PAGER='less'

