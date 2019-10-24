#/usr/bin/env sh

set -e

echo "Installing linux configuration files."
cp -v $(dirname "$0")/.vimrc ~/.vimrc
cp -v $(dirname "$0")/.bash_aliases ~/.bash_aliases
echo "Done!"
