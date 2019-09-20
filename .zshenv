# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# User configuration

##########
# Common #
##########

export LC_ALL=en_US.UTF-8
# nvm
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
# https://github.com/nvm-sh/nvm/issues/1277#issuecomment-356571440
# Defer initialization of nvm until nvm, node or a node-dependent command is
# run. Ensure this block is only run once if .bashrc gets sourced multiple times
# by checking whether __init_nvm is a function.
if [ -s "$HOME/.nvm/nvm.sh" ] && [ ! "$(whence -w __init_nvm)" = function ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
    declare -a __node_commands=('nvm' 'node' 'npm' 'yarn' 'gulp' 'grunt' 'webpack')
    function __init_nvm() {
        for i in "${__node_commands[@]}"; do unalias $i; done
        . "$NVM_DIR"/nvm.sh
        unset __node_commands
        unset -f __init_nvm
    }
    for i in "${__node_commands[@]}"; do alias $i='__init_nvm && '$i; done
fi
# cargo
export PATH="$HOME/.cargo/bin:$PATH"
# rustup
export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup

#########
# MacOS #
#########

# homebrew
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
export HOMEBREW_NO_AUTO_UPDATE=true
# MySQL
export PATH=$PATH:/usr/local/mysql/bin
# dlv
export PATH=$PATH:$HOME/go/bin
# gpg
export GPG_TTY=$(tty)
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/Cellar/openvpn/2.4.6/sbin:$PATH"
export PATH="/usr/local/sbin:$PATH"
# llvm
export PATH="/usr/local/opt/llvm/bin:$PATH"
#export LDFLAGS="-L/usr/local/opt/llvm/lib"
#export CPPFLAGS="-I/usr/local/opt/llvm/include"
#export CPATH=/Library/Developer/CommandLineTools/usr/include/c++/v1
# coreutils gnubin
# PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

#########
# Linux #
#########

# autojump
. /usr/share/autojump/autojump.sh

