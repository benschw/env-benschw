ZSH_ROOT=$HOME/.env
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

export EDITOR='vim'
export EDITOR='vim'
export PAGER='less'

export GOROOT=/opt/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin

# curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.25.4/install.sh | bash
export NVM_DIR="/home/ben/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export CHROME_BIN=/usr/bin/chromium-browser

export GTD_REPO=ghissues
export GTD_GH_TOKEN=70879a7b6a7721c0224ddf8c52f2a93f569d536c
export GTD_GH_USER=benschw
export GTD_GH_REPO=gtd
export GTD_CONTEXT=@work

export AWS_ACCESS_KEY_ID=AKIAJWN36CZNBCQXFFTQ
export AWS_SECRET_ACCESS_KEY=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

alias gw="./gradlew"
