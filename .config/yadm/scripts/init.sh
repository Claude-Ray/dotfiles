#!/bin/bash

SRC_PATH=~/.config/yadm/scripts
BIN_PATH=/usr/local/bin

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  sudo ln -snf $SRC_PATH/easyconnect.sh $BIN_PATH/easyconnect
  sudo ln -snf $SRC_PATH/update.sh $BIN_PATH/update
  sudo ln -snf $SRC_PATH/wifi.sh $BIN_PATH/wifi
  sudo ln -snf $SRC_PATH/idea.sh $BIN_PATH/idea
fi
