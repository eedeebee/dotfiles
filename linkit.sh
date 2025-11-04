:

if [ ! -e ~/.origdotfiles ] ; then
    echo 'Saving original dotfiles...'
    mkdir ~/.origdotfiles

    mv -f \
        ~/.vimrc \
        ~/.zprofile \
        ~/.zshrc \
        ~/.origdotfiles
fi

ln -f ~/repos/dotfiles/.vimrc ~/.vimrc
ln -f ~/repos/dotfiles/.zprofile ~/.zprofile
ln -f ~/repos/dotfiles/.zshrc ~/.zshrc
# ln -f ~/repos/dotfiles/.zshenv ~/.zshenv

mkdir -p ~/.vim-backup-dir
