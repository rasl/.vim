#!/bin/sh
git submodule init
git submodule update
if [ "$PWD" = "$HOME/.vim" ]
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
vim +BundleInstall +qa!

