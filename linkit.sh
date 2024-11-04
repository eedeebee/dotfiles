:

if [ ! -e ~/.origdotfiles ] ; then
    echo 'hello'
    mkdir ~/.origdotfiles

    mv \
        ~/.cshrc \
        ~/.vimrc \
        ~/.origdotfiles
fi

ln -f ~/repos/dotfiles/.cshrc ~/.cshrc
ln -f ~/repos/dotfiles/.vimrc ~/.vimrc
ln -f ~/repos/dotfiles/.zprofile ~/.zprofile
ln -f ~/repos/dotfiles/.zshrc ~/.zshrc
ln -f ~/repos/dotfiles/.zshenv ~/.zshenv

mkdir -p ~/.vim-backup-dir
