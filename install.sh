#!/bin/sh
git submodule init
git submodule update
if [ "$PWD" -eq "$HOME/.vim" ]
then
	ln -s $PWD/.vimrc $HOME/.vimrc
	ln -s $PWD/.vimrc $HOME/.gvimrc
else
	mv $HOME/.vimrc $HOME/.vimrc.backup
	ln -s $PWD/.vimrc $HOME/.vimrc
	ln -s $PWD/.vimrc $HOME/.gvimrc
	mv $HOME/.vim $HOME/.vim.backup
	ln -s $PWD $HOME/.vim
fi
##
# for DBGp-Remote-Debugger-Interface
# (hard code in file debugger.vim, search debugger.py)
##
if [ ! -d "$PWD/plugin" ]
then
	mkdir -p $PWD/plugin
fi
if [ ! -s $PWD/plugin/debugger.py ]
then	
	ln -s ../bundle/DBGp-Remote-Debugger-Interface/plugin/debugger.py $PWD/plugin/debugger.py
fi
vim +BundleInstall +qa!

