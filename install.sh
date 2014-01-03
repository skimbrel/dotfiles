#!/bin/bash

ln -s ~/dotfiles/screenrc ~/.screenrc
ln -s ~/dotfiles/bash_helpers ~/.bash_helpers
ln -s ~/dotfiles/git-completion.sh ~/.git-completion.sh
ln -s ~/dotfiles/bash_prompt ~/.bash_prompt
ln -s ~/dotfiles/bashrc ~/.bashrc
mkdir -p ~/.vim/autoload
curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
ln -s ~/dotfiles/bundle ~/.vim/bundle
git submodule update --init
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/ackrc ~/.ackrc
ln -s ~/dotfiles/gitignore_global ~/.gitignore_global
ln -s ~/dotfiles/git_template ~/.git_template
ln -s ~/dotfiles/gitconfig ~/.gitconfig

mkdir -p ~/.local/bin
mkdir -p ~/.vim/plugin
ln -s ~/dotfiles/git-wip/git-wip ~/.local/bin/git-wip
ln -s ~/dotfiles/git-wip/vim/plugin/git-wip.vim ~/.vim/plugin/git-wip.vim

ln -s ~/dotfiles/scripts ~/.scripts
