#!/bin/bash

if [ command -v dircolors >/dev/null 2>&1 ]; then
	eval `dircolors $ENV_ROOT/dircolors`
else
	alias ls="ls -G"
fi
export PATH="/Users/ben.schwartz/.local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

#export JAVA_HOME="/usr/lib/jvm/default-java/jre/"

PS1='\w\$ '

export EDITOR='vim'
export EDITOR='vim'
export PAGER='less'

export HORDE_ENSURE_VBOXNET=true

export HORDE_DNS=10.1.7.100
export HORDE_IP=172.20.20.1
export HORDE_MYSQL_PUBLISH_PORT=3306
#export HORDE_SERVICES=splunk
export AWSPROXY_USER=ben.schwartz
export AWSPROXY_SSHKEY=/Users/ben.schwartz/.ssh/id_rsa
export AWSPROXY_ENV=dev


export GO15VENDOREXPERIMENT=1

export VAULT_ADDR=http://localhost:8200
export VAULT_TOKEN=horde


export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin


export PATH=$PATH:/opt/terraform/current


. ~/.env/shellfunc/common.sh
. ~/.env/shellfunc/misc-docker.sh
. ~/.env/shellfunc/services.sh


#https://github.com/jfrazelle/dotfiles/blob/master/.dockerfunc

alias ll='ls -lF'
alias la='ls -A'
alias l='ls -CF'

alias gw="./gradlew"
alias bashup="source ~/.bashrc"

alias nyan="docker run -it supertest2014/nyan"

#fortune -a -s | lolcat
export LD_LIBRARY_PATH='/usr/lib/vlc'
export VLC_PLUGIN_PATH='/usr/lib/vlc/plugins'

#. ~/.chores-google-sso-creds.sh

if [ $(uname) == "Darwin" ]; then
	defaults write NSGlobalDomain KeyRepeat -int 3         # normal minimum is 15 (225 ms)
	defaults write NSGlobalDomain InitialKeyRepeat -int 20 # normal minimum is 2 (30 ms)
	defaults write com.googlecode.iterm2 PromptOnQuit -bool false
	defaults write com.googlecode.iterm2 PerformDNSLookups -bool false

fi

export CLUSTER_NAME=k8s.dev.ksops.net
export K8S_ROLE_ARN=arn:aws:iam::969204706979:role/kasasa-architecture

export CC_PATH=$HOME/dev/component-config
export PATH=~/.composer/vendor/bin:$PATH
