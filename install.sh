#!/bin/bash

ln -s screenrc ~/.screenrc
ln -s bash_helpers ~/.bash_helpers
ln -s git-completion.sh ~/.git-completion.sh
ln -s bash_prompt ~/.bash_prompt
ln -s bashrc ~/.bashrc
mkdir -p ~/.vim/bundle ~/.vim/autoload
curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
git submodule update --init
ln -s vimrc ~/.vimrc


