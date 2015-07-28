
	# rxvt & clipboard perl
	apt-get install xsel rxvt-unicode-256color

### Install

	chsh -s /bin/zsh

	git clone git@github.com:benschw/zsh-benschw.git ~/.zsh
	cd ~/.vim
	git submodule init
	git submodule update

	ln -s $HOME/.zsh/zshrc $HOME/.zshrc
	ln -s $HOME/.zsh/tmux.conf $HOME/.tmux.conf
	ln -s $HOME/.zsh/gitconfig $HOME/.gitconfig
	ln -s $HOME/.zsh/Xdefaults $HOME/.Xdefaults

### powerline fonts

	git clone https://github.com/powerline/fonts.git
	cd fonts
	./install.sh

	# update in terminal profile

