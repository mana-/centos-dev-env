# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#
# Gitプロンプト表示設定
#

# git コマンド補完
if [ -f /opt/git/git-completion.bash ]; then
    source /opt/git/git-completion.bash
fi

# git プロンプト表示
if [ -f /opt/git/git-prompt.sh ]; then
    source /opt/git/git-prompt.sh
fi

# プロンプトフォーマット指定
PS1="[\u@\W]\[\033[36m\]\$(__git_ps1)\[\033[00m\]\$ "

# alias設定
#
# いきなり削除の防止
alias rm='rm -i'
# リスト表示
alias ls='ls -G'
alias ll='ls -lG'
alias la='ls -laG'

# sudoユーザの追加
alias sudoers='sudo vim /etc/sudoers'

# User specific aliases and functions

export PATH=$PATH:~/bin
