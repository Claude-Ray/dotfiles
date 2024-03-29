#!/bin/bash

yadm pull
cd ~/.oh-my-zsh && git pull
cd ~/.tmux && git pull
cd ~/.emacs.d && git pull
cd ~/.spacemacs.d && git pull
cd
if [[ "$OSTYPE" == "darwin"* ]]; then
  brew update
  brew upgrade
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
  if  [[ -f /etc/arch-release ]]; then
    yay
  elif [[ -f /etc/debian_version ]]; then
    sudo apt update
    sudo apt upgrade
  fi
fi
