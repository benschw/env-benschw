
	git clone git@github.com:benschw/env-benschw.git ~/.env
	cd ~/.env
	git submodule init
	git submodule update

### Git
	
	ln -s $HOME/.env/gitconfig $HOME/.gitconfig


### Fonts

	git clone https://github.com/powerline/fonts.git
	cd fonts
	./install.sh

	# update in terminal profile

### bash
http://superuser.com/questions/552863/bash-home-end-delete-key-inserting-tilde-or-if-preceded-by-escape-key-1-3

	brew install bash
	sudo -s
	echo /usr/local/bin/bash >> /etc/shells
	chsh -s /usr/local/bin/bash
	
	ln -s $HOME/.env/bashrc $HOME/.bashrc


### Tmux

	ln -s $HOME/.env/tmux.conf $HOME/.tmux.conf
	
### Vim

	ln -s $HOME/.env/vim $HOME/.vim
	ln -s $HOME/.env/vimrc $HOME/.vimrc
	
	# in vim
	:GoInstallBinaries

	# manage packages
	git submodule add https://github.com/foo/vim-bar vim/pack/test/start/vim-bar
	
	git submodule update --remote --merge

	git submodule deinit vim/pack/test/start/vim-bar
	git rm vim/pack/test/start/vim-bar
	rm -Rf .git/modules/vim/pack/test/start/vim-bar

#### Key Bindings
	
	\q                - quick notes
	
	\\                - toggle NerdTree file browser
	\<ENTER>          - disable highlighting
	\r                - toggle relative / absolute line numbers

	\f                - CtrlP
	\.                - CtrlPTag
	\w                - buffer explorer
	\]                - next buffer
	\[                - previous buffer
	
### CTags

	apt-get install exuberant-ctags
	ln -s $HOME/.env/ctags $HOME/.ctags

	# usage
	ctags .

### urxvt

	# rxvt & clipboard perl
	apt-get install rxvt-unicode-256color xsel

	ln -s $HOME/.env/Xdefaults $HOME/.Xdefaults

### add Mac user to Administrators group

	dscl . -append /groups/admin GroupMembership USERNAME

