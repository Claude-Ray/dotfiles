#!/bin/bash

if [ -z $(which zsh) ]
then
    echo "installing zsh"
    sudo apt install -y zsh curl
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    sudo chsh -s $(which zsh)
    sudo apt install -y autojump
    echo "# autojump\n. /usr/share/autojump/autojump.sh" >> .zshrc
else
    echo "zsh is installed"
fi

/bin/zsh
