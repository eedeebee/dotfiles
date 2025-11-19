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

# Link bin scripts
if [ -d ~/repos/dotfiles/bin ]; then
    echo 'Linking bin scripts...'
    mkdir -p ~/bin
    for script in ~/repos/dotfiles/bin/*; do
        if [ -f "$script" ]; then
            ln -sf "$script" ~/bin/$(basename "$script")
            echo "  Linked $(basename "$script")"
        fi
    done
fi
