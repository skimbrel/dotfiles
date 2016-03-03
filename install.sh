#!/usr/local/bin/zsh

## Prezto setup
if [ ! -e "${ZDOTDIR:-$HOME}/.zprezto" ]; then
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
    setopt EXTENDED_GLOB
    for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
        ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done
fi

## Font magic
git clone git@github.com:powerline/fonts.git ~/powerline-fonts
open ~/powerline-fonts/Inconsolata/Inconsolata\ for\ Powerline.otf

## Shell configuration
ln -s ~/dotfiles/zshrc ~/.zshrc
touch ~/.zshrc_local


## Vim plugins and configuration

# Set up pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Link bundle directory and install submodules into it
ln -s ~/dotfiles/bundle ~/.vim/bundle
git submodule update --init
ln -s ~/dotfiles/vimrc ~/.vimrc

mkdir -p ~/.local/bin
mkdir -p ~/.vim/plugin

## Git
ln -s ~/dotfiles/gitignore_global ~/.gitignore_global
ln -s ~/dotfiles/git_template ~/.git_template
ln -s ~/dotfiles/gitconfig ~/.gitconfig

# sigh
brew install npm
npm install -g diff-so-fancy

## Misc

# Link scripts into place for use in shell functions
ln -s ~/dotfiles/scripts ~/.scripts

# GNU Screen
ln -s ~/dotfiles/screenrc ~/.screenrc
