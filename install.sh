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
    tmux.conf \
"

function install_dotfile() {
    dotfile=$1
    target_name=$2

    if [[ $(readlink -f $target_name) != $(readlink -f $dotfile) ]]; then
        echo "Installing .${dotfile}"
        if [[ -f $target_name ]]; then
            mv $target_name "backups/${dotfile}"
        fi
        ln -s ${SCRIPT_DIR}/${dotfile} $target_name
    fi
}

mkdir -p backups
mkdir -p ${HOME}/.config

git submodule update --init --recursive

for dotfile in $DOTFILES
do
    install_dotfile "$dotfile" "${HOME}/.${dotfile}"
done

for plugin in $ZSH_PLUGIN_DIR*
do
    echo "Installing ${plugin}"
    if [[ ! -f $target_linkname ]]; then
        ln -s ${plugin} ~/.oh-my-zsh/custom/plugins/$(basename $plugin)
    fi
done

install_dotfile "terminator" "$HOME/.config/terminator"
