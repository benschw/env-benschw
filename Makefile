


default: help


clean: ## clean up tmp stuff from install
	@rm -rf tmp

apt-update:
	sudo apt-get update

urxvt: ## install and configure urxvt and clipboard support
	# rxvt & clipboard perl
	sudo apt-get install -y rxvt-unicode-256color xsel
	
	ln -sf $HOME/.env/Xdefaults $HOME/.Xdefaults


git: ## configure git
	sudo apot-get install -y git
	ln -sf $(HOME)/.env/gitconfig $(HOME)/.gitconfig

fonts:
	@mkdir -p tmp
	@git clone https://github.com/powerline/fonts.git tmp/fonts
	tmp/fonts/install.sh

tmux: ## configure tmux
	sudo apt-get install -y tmux
	ln -sf $(HOME)/.env/tmux.conf $(HOME)/.tmux.conf


vim: ## configure vim
	sudo apt-get install -y vim
	ln -sf $(HOME)/.env/vimrc $(HOME)/.vimrc
	@echo "=> Now run \`:GoInstallBinaries\` within vim"

ctags: ## install and configure ctags for vim
	sudo apt-get install -y exuberant-ctags
	ln -sf $(HOME)/.env/ctags $(HOME)/.ctags

misc: ## misc packages: lolcat
	sudo apt-get install -y lolcat

docker:
	sudo apt-get install -y apt-transport-https ca-certificates linux-image-extra-`uname -r`
	sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
	sudo bash -c "echo 'deb https://apt.dockerproject.org/repo ubuntu-wily main' > /etc/apt/sources.list.d/docker.list"
	sudo apt-get update
	sudo apt-get install -y docker-engine
	sudo usermod -aG docker ben
	sudo systemctl enable docker
	sudo service docker start

install: apt-update urxvt git fonts tmux vim ctags docker ## Install packages and configuration files



.PHONY: help

# http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-25s\033[0m %s\n", $$1, $$2}'



