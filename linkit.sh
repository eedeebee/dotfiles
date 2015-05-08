:

if [ ! -e ~/.origdotfiles ] ; then
    echo 'hello'
    mkdir ~/.origdotfiles

    mv \
        ~/.cshrc \
        ~/.vimrc \
        ~/.marklogic.cshrc \
        ~/.origdotfiles
fi

ln -f ~/repos/dotfiles/.cshrc ~/.cshrc
ln -f ~/repos/dotfiles/.vimrc ~/.vimrc
if [ -e ~/repos/dotfiles/.marklogic.cshrc ] ; then
    ln -f ~/repos/dotfiles/.marklogic.cshrc ~/.marklogic.cshrc
fi
if [ -e ~/repos/dotfiles/.udemy.cshrc ] ; then
    ln -f ~/repos/dotfiles/.udemy.cshrc ~/.udemy.cshrc
fi

mkdir -p ~/.vim-backup-dir
