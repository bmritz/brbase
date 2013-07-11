#!/bin/bash

echo "Naming machine $1"
echo "source \$HOME/Base/config/bash/bashrc" >> $HOME/.bashrc
echo "source \$HOME/Base/config/bash/bash_aliases" >> $HOME/.bashrc
echo "export PS1=[$1]\$PS1" >> $HOME/.bashrc
echo "source \$HOME/Base/config/vim/vimrc" >> $HOME/.vimrc
rm -rf $HOME/.vim
cp -r $HOME/Base/config/vim/vimfiles $HOME/.vim
source $HOME/.bashrc
