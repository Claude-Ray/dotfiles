#!/bin/bash

defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 15

echo "KeyRepeat: "$(defaults read NSGlobalDomain KeyRepeat)
echo "InitialKeyRepeat: "$(defaults read NSGlobalDomain InitialKeyRepeat)

echo "WARNING: Reboot required!"

