
	git clone git@github.com:benschw/env-benschw.git ~/.env
	cd ~/.env
	git submodule init
	git submodule update

### Git
	
	ln -s $HOME/.env/gitconfig $HOME/.gitconfig

### urxvt

	# rxvt & clipboard perl
	apt-get install rxvt-unicode-256color xsel

	ln -s $HOME/.env/Xdefaults $HOME/.Xdefaults


### Fonts

	git clone https://github.com/powerline/fonts.git
	cd fonts
	./install.sh

	# update in terminal profile

### Zsh

	chsh -s /bin/zsh


	ln -s $HOME/.env/zshrc $HOME/.zshrc

### Tmux

	ln -s $HOME/.env/tmux.conf $HOME/.tmux.conf
	
### Vim

	ln -s $HOME/.env $HOME/.vim
	ln -s $HOME/.env/vimrc $HOME/.vimrc
	
	# in vim
	:GoInstallBinaries

	
### CTags

	apt-get install exuberant-ctags
	ln -s $HOME/.env/ctags $HOME/.ctags

	# usage
	ctags .

## Key Bindings
### vim


	\q                - quick notes
	
	\\                - toggle NerdTree file browser
	\<ENTER>          - disable highlighting
	\r                - toggle relative / absolute line numbers

	\f                - CtrlP
	\.                - CtrlPTag
	\w                - buffer explorer
	\]                - next buffer
	\[                - previous buffer

### vim-go
	
	\b                - go-build
	\t                - go-test
	
