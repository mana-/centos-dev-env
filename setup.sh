#!/bin/bash

# 設定ファイルの配置
if [ -e ~/.vimrc ]; then
  mv ~/.vimrc ~/.vimrc.bak
fi
ln -s ~/centos-dev-env/.vimrc ~/.vimrc

if [ -e ~/.bashrc ]; then
  mv ~/.bashrc ~/.bashrc.bak  
fi
ln -s ~/centos-dev-env/.bashrc ~/.bashrc

if [ -e ~/.bash_profile ]; then
  mv ~/.bash_profile ~/.bash_profile.bak  
fi
ln -s ~/centos-dev-env/.bash_profile ~/.bash_profile

# vim
mkdir -p ~/.vim/bundle
if [ ! -e ~/.vim/bundle/neobundle.vim ]; then
  git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi

