#!/bin/sh
git submodule init
git submodule update
mv $HOME/.vimrc $HOME/.vimrc.backup
ln -s $PWD/.vimrc $HOME/.vimrc
mv $HOME/.vim $HOME/.vim.backup
ln -s $PWD/.vim $HOME/.vim
vim +BundleInstall +qa!

