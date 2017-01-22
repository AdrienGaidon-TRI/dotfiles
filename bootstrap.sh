#!/usr/bin/env bash

files="aliases bash_profile bash_prompt bashrc condarc curlrc functions gitconfig gitignore inputrc screenrc wgetrc tmux.conf vimrc"

function doIt() {
	# for i3 window manager
	cp $opts $PWD/i3_config ~/.config/i3/config
	cp i3exit ~/.local/bin/
    cp $PWD/i3-workspace-1.json ~/.config/i3/
	#cp $opts {$PWD/,~/.}i3status.conf
	# the rest
	for f in $files; do cp -f $f ~/.$f; done;
	# vim
	cp -rf init ~/;
	mkdir -p ~/.vim/colors/ && cp solarized.vim ~/.vim/colors/;
	ln -sf ~/.vim ~/.config/nvim
	ln -sf ~/.vimrc ~/.config/nvim/init.vim
	#source ~/.bash_profile;
}


if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
