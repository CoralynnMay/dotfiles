git clone https://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
ln -s $(pwd)/vimbundle $HOME/.vimbundle
ln -s $(pwd)/vimrc $HOME/.vimrc
vim -u $HOME/.vimbundle +BundleInstall +qall
