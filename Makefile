


default: help


clean: ## clean up tmp stuff from install
	@rm -rf tmp

apt-update:
	sudo apt-get update


urxvt: ## install and configure urxvt and clipboard support
	# rxvt & clipboard perl
	sudo apt-get install -y rxvt-unicode-256color xsel
	
	ln -sf $(PWD)/Xdefaults $(HOME)/.Xdefaults


git: ## configure git
	sudo apt-get install -y git
	ln -sf $(PWD)/gitconfig $(HOME)/.gitconfig


fonts: ## download and install fonts for vim
	@mkdir -p tmp
	@git clone https://github.com/powerline/fonts.git tmp/fonts
	tmp/fonts/install.sh

basic: ## configure tmux, vim, ctags, fonts
	sudo apt-get install -y tmux vim exuberant-ctags
	ln -sf $(PWD)/bashrc $(HOME)/.bashrc
	ln -sf $(PWD)/tmux.conf $(HOME)/.tmux.conf
	ln -sf $(PWD)/ctags $(HOME)/.ctags
	ln -sf $(PWD)/vimrc $(HOME)/.vimrc
	@echo "=> Now run \`:GoInstallBinaries\` within vim"

misc: ## misc packages: lolcat
<<<<<<< HEAD
	sudo apt-get install -y lolcat fortune cowsay
=======
	sudo apt-get install -y lolcat fortune-mod
>>>>>>> 45c0b1a9e571246b936415d34bf661c03ad4cbad

docker:
	sudo apt-get install -y apt-transport-https ca-certificates linux-image-extra-`uname -r`
	sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
	sudo bash -c "echo 'deb https://apt.dockerproject.org/repo ubuntu-wily main' > /etc/apt/sources.list.d/docker.list"
	sudo apt-get update
	sudo apt-get install -y docker-engine
	sudo usermod -aG docker $(USER)
	sudo systemctl enable docker
	sudo service docker start

install: apt-update urxvt git basic misc fonts docker ## Install packages and configuration files



.PHONY: help

# http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-25s\033[0m %s\n", $$1, $$2}'



