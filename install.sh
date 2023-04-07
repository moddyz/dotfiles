#/usr/bin/env sh

set -euxo pipefail

echo "Installing linux configuration files."
cp -v $(dirname "$0")/.vimrc ~/.vimrc
mkdir -v -p ~/.vim/plugin/
cp -r -v $(dirname "$0")/.vim ~/
cp -v $(dirname "$0")/.bash_aliases ~/.bash_aliases
cp -v $(dirname "$0")/.tmux.conf ~/.tmux.conf
cp -v $(dirname "$0")/.gdbinit ~/.gdbinit

if [[ $OSTYPE == 'darwin'* ]]; then
    echo "Mac OSX detected."
    mkdir -v -p ~/.config/karabiner/
    cp -v $(dirname "$0")/.config/karabiner/karabiner.json ~/.config/karabiner
fi

echo "Done!"
