curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ln -s $(pwd)/vimrc $HOME/.config/nvim/init.vim
ln -s $(pwd)/tmux.conf $HOME/.tmux.conf
rm $HOME/.zshrc
ln -s $(pwd)/zshrc $HOME/.zshrc
nvim  +PlugInstall +qall
