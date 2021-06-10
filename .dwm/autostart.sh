#!/bin/bash

if command -v fcitx &> /dev/null; then
  fcitx &
elif command -v fcitx5 &> /dev/null; then
  fcitx5 &
fi

if command -v autokey-qt &> /dev/null; then
  autokey-qt &
fi
