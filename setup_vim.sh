rm -rf $HOME/.vim*
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
sh ./install.sh
rm ./install.sh
ln -s $(pwd)/vimbundle $HOME/.vimbundle
ln -s $(pwd)/vimrc $HOME/.vimrc
vim  +NeoBundleInstall +qall
