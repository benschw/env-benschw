#!/bin/bash
BASH_ROOT=$HOME/.env

eval `dircolors $BASH_ROOT/dircolors`


PS1='\w\$ '

export EDITOR='vim'
export EDITOR='vim'
export PAGER='less'


export GOROOT=/opt/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin


. ~/.shellfunc/common.sh
. ~/.shellfunc/osd.sh
. ~/.shellfunc/services.sh
. ~/.shellfunc/fl.sh
. ~/.shellfunc/aws.sh


#https://github.com/jfrazelle/dotfiles/blob/master/.dockerfunc

alias ll='ls -lF'
alias la='ls -A'
alias l='ls -CF'

alias gw="./gradlew"
alias bashup="source ~/.bashrc"

alias nyan="docker run -it supertest2014/nyan"

fortune -a -s | lolcat
