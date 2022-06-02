#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ZSH_PLUGIN_DIR="${SCRIPT_DIR}/zsh-plugins/"

DOTFILES="\
    screenrc \
    vim \
    vimrc \
    bash_aliases \
    gitconfig \
    zshrc \
"

for dotfile in $DOTFILES
do
    echo "Installing .${dotfile}"
    ln -s ${SCRIPT_DIR}/${dotfile} "${HOME}/.${dotfile}"
done

for plugin in $ZSH_PLUGIN_DIR*
do
    echo "Installing ${plugin}"
    ln -s ${plugin} ~/.oh-my-zsh/custom/plugins/$(basename $plugin)
done

ln -s ${SCRIPT_DIR}/terminator $HOME/.config/terminator
