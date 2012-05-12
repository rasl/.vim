#!/bin/sh
git submodule init
git submodule update
mv $HOME/.vimrc $HOME/.vimrc.backup
ln -s $PWD/.vimrc $HOME/.vimrc
ln -s $PWD/.vimrc $HOME/.gvimrc
mv $HOME/.vim $HOME/.vim.backup
ln -s $PWD/.vim $HOME/.vim
##
# for DBGp-Remote-Debugger-Interface
# (hard code in file debugger.vim, search debugger.py)
##
if [ ! -d "$PWD/.vim/plugin" ]
then
	mkdir -p $PWD/.vim/plugin
fi
if [ ! -s $PWD/.vim/plugin/debugger.py ]
then	
	ln -s ../../.vim/bundle/DBGp-Remote-Debugger-Interface/plugin/debugger.py $PWD/.vim/plugin/debugger.py
fi
vim +BundleInstall +qa!

