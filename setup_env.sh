curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
sh ./install.sh
rm ./install.sh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ln -s $(pwd)/vimrc $HOME/.config/nvim/init.vim
ln -s $(pwd)/tmux.conf $HOME/.tmux.conf
rm $HOME/.zshrc
ln -s $(pwd)/zshrc $HOME/.zshrc
nvim  +NeoBundleInstall +qall
