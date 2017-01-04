#!/bin/bash
eval `dircolors $ENV_ROOT/dircolors`

#export JAVA_HOME="/usr/lib/jvm/default-java/jre/"

PS1='\w\$ '

export EDITOR='vim'
export EDITOR='vim'
export PAGER='less'

export HORDE_DNS=10.1.7.100
export HORDE_IP=172.17.0.1
export GO15VENDOREXPERIMENT=1

export GOROOT=/opt/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin


export PATH=$PATH:/opt/terraform/current


. ~/.env/shellfunc/common.sh
. ~/.env/shellfunc/misc-docker.sh
. ~/.env/shellfunc/services.sh
. ~/.env/shellfunc/aws.sh


#https://github.com/jfrazelle/dotfiles/blob/master/.dockerfunc

alias ll='ls -lF'
alias la='ls -A'
alias l='ls -CF'

alias gw="./gradlew"
alias bashup="source ~/.bashrc"

alias nyan="docker run -it supertest2014/nyan"

#fortune -a -s | cowsay -f tux | lolcat
