#!/bin/bash

## Shell configuration
ln -s ~/dotfiles/git-completion.sh ~/.git-completion.sh
ln -s ~/dotfiles/bash_prompt ~/.bash_prompt
ln -s ~/dotfiles/bashrc ~/.bashrc
touch ~/.bashrc_local

## Vim plugins and configuration

# Set up pathogen
mkdir -p ~/.vim/autoload
curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

# Link bundle directory and install submodules into it
ln -s ~/dotfiles/bundle ~/.vim/bundle
git submodule update --init
ln -s ~/dotfiles/vimrc ~/.vimrc

# Install git-wip manually as it doesn't like pathogen
mkdir -p ~/.local/bin
mkdir -p ~/.vim/plugin
ln -s ~/dotfiles/git-wip/git-wip ~/.local/bin/git-wip
ln -s ~/dotfiles/git-wip/vim/plugin/git-wip.vim ~/.vim/plugin/git-wip.vim

# Git
ln -s ~/dotfiles/gitignore_global ~/.gitignore_global
ln -s ~/dotfiles/git_template ~/.git_template
ln -s ~/dotfiles/gitconfig ~/.gitconfig

# Link scripts into place for use in shell functions
ln -s ~/dotfiles/scripts ~/.scripts

# GNU Screen
ln -s ~/dotfiles/screenrc ~/.screenrc

# Slate
ln -s ~/dotfiles/slate ~/.slate
