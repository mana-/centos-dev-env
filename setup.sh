#!/bin/bash

# homebrew インストール
which brew > /dev/null
status=$?
if [ $status -ne 0 ]; then
  echo "**********************************************************"
  echo "**********************************************************"
  echo "homebrew install"
  echo "**********************************************************"
  echo "**********************************************************"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

which wget > /dev/null
status=$?
if [ $status -ne 0 ]; then
  echo "**********************************************************"
  echo "**********************************************************"
  echo "wget install"
  echo "**********************************************************"
  echo "**********************************************************"
  brew install wget
fi

# gitプロンプト表示設定用ファイル格納先準備
sudo mkdir -p /opt/git/
pushd /opt/git/
if [ ! -e /opt/git/git-completion.bash ]; then
  echo "**********************************************************"
  echo "**********************************************************"
  echo "wget git-completion.bash "
  echo "**********************************************************"
  echo "**********************************************************"
  sudo wget https://raw.github.com/git/git/master/contrib/completion/git-completion.bash
fi

if [ ! -e /opt/git/git-prompt.sh ]; then
  echo "**********************************************************"
  echo "**********************************************************"
  echo "wget git-prompt.sh"
  echo "**********************************************************"
  echo "**********************************************************"
  sudo wget https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh
fi
popd

# 設定ファイルの配置
if [ -e ~/.vimrc ]; then
  mv ~/.vimrc ~/.vimrc.bak
fi
ln -s ~/dev-env/.vimrc ~/.vimrc

if [ -e ~/.bashrc ]; then
  mv ~/.bashrc ~/.bashrc.bak  
fi
ln -s ~/dev-env/.bashrc ~/.bashrc

if [ -e ~/.bash_profile ]; then
  mv ~/.bash_profile ~/.bash_profile.bak  
fi
ln -s ~/dev-env/.bash_profile ~/.bash_profile

# bashの設定反映
echo "**********************************************************"
echo ".bashrc reflesh"
echo "**********************************************************"
source ~/.bashrc

# vim
echo "**********************************************************"
echo "Setting for Vim"
echo "**********************************************************"
mkdir -p ~/.vim/bundle
if [ ! -e ~/.vim/bundle/neobundle.vim ]; then
  git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi

