#!/bin/bash

echo $HOME

echo "Naming machine $1"
rm $HOME/.bashrc
echo "source \$HOME/Base/config/bash/bashrc" >> $HOME/.bashrc
echo "source \$HOME/Base/config/bash/bash_aliases" >> $HOME/.bashrc
echo "source \$HOME/Base/config/bash/bash_commands" >> $HOME/.bashrc
echo "export PS1=[$1]\$PS1" >> $HOME/.bashrc
echo "source \$HOME/Base/config/vim/vimrc" >> $HOME/.vimrc
rm -Rf $HOME/.wrkon
mkdir $HOME/.wrkon
rm -Rf $HOME/.vim
cp -r $HOME/Base/config/vim/vimfiles $HOME/.vim
source $HOME/.bashrc
