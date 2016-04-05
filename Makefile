


default: help


clean: ## clean up tmp stuff from install
	@rm -rf tmp

apt-update:
	sudo apt-get update

urxvt: apt-update ## install and configure urxvt and clipboard support
	# rxvt & clipboard perl
	sudo apt-get install -y rxvt-unicode-256color xsel
	
	ln -sf $HOME/.env/Xdefaults $HOME/.Xdefaults


git: ## configure git
	ln -sf $(HOME)/.env/gitconfig $(HOME)/.gitconfig

fonts:
	@mkdir -p tmp
	@git clone https://github.com/powerline/fonts.git tmp/fonts
	tmp/fonts/install.sh

tmux: ## configure tmux
	ln -sf $(HOME)/.env/tmux.conf $(HOME)/.tmux.conf


vim: ## configure vim
	ln -sf $(HOME)/.env/vimrc $(HOME)/.vimrc
	@echo "=> Now run \`:GoInstallBinaries\` within vim"

ctags: apt-update ## install and configure ctags for vim
	sudo apt-get install -y exuberant-ctags
	ln -sf $(HOME)/.env/ctags $(HOME)/.ctags

install: urxvt git fonts tmux vim ctags ## Install packages and configuration files



.PHONY: help

# http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-25s\033[0m %s\n", $$1, $$2}'



