# TomS's stuff# ln -sf ~/.my-osx-setup/bash_aliases ~/.bash_aliases
# TomS's stuff# ln -sf ~/.my-osx-setup/screen-keys.conf ~/.tmux.conf
# TomS's stuff#
# TomS's stuff# git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
# TomS's stuff#
# TomS's stuff# bash -c "base16_google-dark"
# TomS's stuff#
# TomS's stuff# git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# TomS's stuff# vim +PluginInstall +qall

touch ~/.localbashrc
touch ~/.localbash_aliases
touch ~/.localgitconfig
touch ~/.localvimrc

ln -sf ~/.my-osx-setup/bin ~/bin

# atom plugins - I want them to just work.
mkdir ~/.atom
ln -sf ~/.my-osx-setup/atom/packages/ ~/.atom/packages

ln -sf ~/.my-osx-setup/bash_profile ~/.bash_profile
ln -sf ~/.my-osx-setup/bashrc ~/.bashrc

ln -sf ~/.my-osx-setup/calendar ~/.calendar

ln -sf ~/.my-osx-setup/gitconfig ~/.gitconfig

ln -sf ~/.my-osx-setup/vimrc ~/.vimrc
ln -sf ~/.my-osx-setup/x2goclient ~/.x2goclient
ln -sf ~/.my-osx-setup/Xmodmap ~/.Xmodmap
ln -sf ~/.my-osx-setup/csshrc ~/.csshrc
