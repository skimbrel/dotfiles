#!/bin/bash

ln -s ~/dotfiles/screenrc ~/.screenrc
ln -s ~/dotfiles/bash_helpers ~/.bash_helpers
ln -s ~/dotfiles/git-completion.sh ~/.git-completion.sh
ln -s ~/dotfiles/bash_prompt ~/.bash_prompt
ln -s ~/dotfiles/bashrc ~/.bashrc
mkdir -p ~/.vim/bundle ~/.vim/autoload
curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
git submodule update --init
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/ackrc ~/.ackrc