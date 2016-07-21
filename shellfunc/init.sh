#!/bin/bash
eval `dircolors $ENV_ROOT/dircolors`


PS1='\w\$ '

export EDITOR='vim'
export EDITOR='vim'
export PAGER='less'


export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin


. ~/.env/shellfunc/common.sh
. ~/.env/shellfunc/osd.sh
. ~/.env/shellfunc/services.sh
. ~/.env/shellfunc/fl.sh
. ~/.env/shellfunc/aws.sh


#https://github.com/jfrazelle/dotfiles/blob/master/.dockerfunc

alias ll='ls -lF'
alias la='ls -A'
alias l='ls -CF'

alias gw="./gradlew"
alias bashup="source ~/.bashrc"

alias nyan="docker run -it supertest2014/nyan"

#fortune -a -s | lolcat
