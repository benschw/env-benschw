ZSH_ROOT=$HOME/.zsh
source $ZSH_ROOT/antigen/antigen.zsh

antigen-use oh-my-zsh

antigen-bundle npm
antigen-bundle bower
antigen-bundle grunt
antigen-bundle gradle
antigen-bundle golang
antigen-bundle vi-mode
antigen-bundle git
antigen-bundle vagrant
antigen-bundle zsh-users/zsh-syntax-highlighting
antigen-bundle zsh-users/zsh-history-substring-search

antigen theme $ZSH_ROOT/themes/foo foo

antigen-apply


eval `dircolors $ZSH_ROOT/dircolors`


export GOROOT=/opt/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin


export EDITOR='vim'
export EDITOR='vim'
export PAGER='less'

