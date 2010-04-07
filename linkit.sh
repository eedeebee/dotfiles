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

ln -f ~/dotfiles/.cshrc ~/.cshrc
ln -f ~/dotfiles/.vimrc ~/.vimrc
ln -f ~/dotfiles/.marklogic.cshrc ~/.marklogic.cshrc
