#!/bin/bash

if command -v fcitx &> /dev/null; then
  fcitx &
elif command -v fcitx5 &> /dev/null; then
  fcitx5 &
fi
