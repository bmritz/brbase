#!/bin/bash

echo $HOME

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "Naming machine $1"
rm $HOME/.bashrc
echo "export USR_HOME=$HOME" >> $HOME/.bashrc
echo "export BASE_DIR=$DIR" >> $HOME/.bashrc
echo "source \$BASE_DIR/config/bash/bashrc" >> $HOME/.bashrc
echo "source \$BASE_DIR/config/bash/bash_aliases" >> $HOME/.bashrc
echo "source \$BASE_DIR/config/bash/bash_commands" >> $HOME/.bashrc
#echo "alias wrkon='python \${HOME}/Base/wrkon/wrkon.py'" >> $HOME/.bashrc
echo "export POST_PS1=\$PS1" >> $HOME/.bashrc
echo "export MACH_NAME=$1" >> $HOME/.bashrc
echo "export PS1=[$1]\$PS1" >> $HOME/.bashrc
echo "export LD_LIBRARY_PATH=/opt/local/lib"
echo "source \$BASE_DIR/config/vim/vimrc" >> $HOME/.vimrc
#rm -Rf $HOME/.wrkon
if [ ! -d "$HOME/.wrkon" ]
then
  mkdir $HOME/.wrkon
fi
cp $DIR/env.source $HOME/.wrkon
rm -Rf $HOME/.vim
cp -r $DIR/config/vim/vimfiles $HOME/.vim
source $HOME/.bashrc
