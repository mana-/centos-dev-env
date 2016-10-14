#!/bin/bash

# vim
mkdir -p ~/.vim/bundle
if [ -e ~/.vim/bundle/neobundle.vim ]; then
  # ファイルの存在あり
  echo "neobundle already installed."
else
  git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi


