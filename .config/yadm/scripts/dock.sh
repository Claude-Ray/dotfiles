#!/bin/bash

if [[ "$OSTYPE" != "darwin"* ]]; then
  echo "OSX only!"
  exit
fi

case $1 in
  "on")
    defaults write com.apple.dock autohide -bool false
    defaults delete com.apple.dock autohide-delay
    defaults delete com.apple.dock no-bouncing
    ;;
  "off")
    defaults write com.apple.dock autohide -bool true
    defaults write com.apple.dock autohide-delay -float 1000
    defaults write com.apple.dock no-bouncing -bool true
    ;;
  "mini")
    defaults write com.apple.dock tilesize -int 1
    ;;
  *)
    defaults write com.apple.dock autohide -bool true
esac

killall Dock

echo "Done."

