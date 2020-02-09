#/usr/bin/env sh

set -e

echo "Installing linux configuration files."
cp -v $(dirname "$0")/.vimrc ~/.vimrc
mkdir -v -p ~/.vim/plugin/
cp -v $(dirname "$0")/plugin/* ~/.vim/plugin/
cp -v $(dirname "$0")/.bash_aliases ~/.bash_aliases
cp -v $(dirname "$0")/.gitconfig ~/.gitconfig
echo "Done!"
