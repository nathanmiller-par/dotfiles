DOTFILES="\
    screenrc \
    vim \
    vimrc \
    bash_aliases \
    gitconfig \
"

IFS=' '
for item in $DOTFILES
do
    echo "Installing .$item"
done
