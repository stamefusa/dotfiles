#!/bin/sh

DOTFILES_DIR=`cd $(dirname $0); pwd`

symbolic_link(){
    ln -siv $1 $2
}

symbolic_link $DOTFILES_DIR/.bashrc $HOME/.bashrc
symbolic_link $DOTFILES_DIR/.bash_profile $HOME/.bash_profile
symbolic_link $DOTFILES_DIR/.vimrc $HOME/.vimrc
symbolic_link $DOTFILES_DIR/.tmux.conf $HOME/.tmux.conf
