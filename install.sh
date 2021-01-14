#/usr/bin/env sh

set -euxo pipefail

echo "Installing linux configuration files."
cp -v $(dirname "$0")/.vimrc ~/.vimrc
mkdir -v -p ~/.vim/plugin/
cp -r -v $(dirname "$0")/.vim ~/
cp -v $(dirname "$0")/.bash_aliases ~/.bash_aliases
cp -v $(dirname "$0")/.tmux.conf ~/.tmux.conf
echo "Done!"
