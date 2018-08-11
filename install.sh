#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

DOTFILES="\
    screenrc \
    vim \
    vimrc \
    bash_aliases \
    gitconfig \
"

IFS=' '
for dotfile in $DOTFILES
do
    echo "Installing .${dotfile}"
    ln -s ${SCRIPT_DIR}/${dotfile} "${HOME}/.${dotfile}"
done
