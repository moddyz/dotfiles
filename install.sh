#/usr/bin/env sh

set -euxo pipefail

echo "Installing files for Linux & MacOS."
cp -v $(dirname "$0")/.vimrc ~/.vimrc
mkdir -v -p ~/.vim/plugin/
cp -r -v $(dirname "$0")/.vim ~/
cp -v $(dirname "$0")/.zsh_aliases ~/.zsh_aliases
cp -v $(dirname "$0")/.tmux.conf ~/.tmux.conf
cp -v $(dirname "$0")/.gdbinit ~/.gdbinit
cp -v $(dirname "$0")/.gitconfig ~/.gitconfig

if [[ $OSTYPE == 'darwin'* ]]; then
    echo "Installing Mac OSX specific configuration"
    mkdir -v -p ~/.config/karabiner/
    cp -v $(dirname "$0")/.config/karabiner/karabiner.json ~/.config/karabiner
fi

echo "Done!"
