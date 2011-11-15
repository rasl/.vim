#!/bin/sh
#git submodule init
#git submodule update
#mv $HOME/.vimrc $HOME/.vimrc.backup
#ln -s $PWD/.vimrc $HOME/.vimrc
#mv $HOME/.vim $HOME/.vim.backup
#ln -s $PWD/.vim $HOME/.vim
# for DBGp-Remote-Debugger-Interface
if [ ! -d "$HOME/.vim/plugin" ]
then
	mkdir -p $HOME/.vim/plugin
fi
if [ ! -s $PWD/.vim/plugin/debugger.py ]
then	
	ln -s ../../.vim/bundle/DBGp-Remote-Debugger-Interface/plugin/debugger.py $PWD/.vim/plugin/debugger.py
fi
#vim +BundleInstall +qa!

