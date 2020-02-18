#!/bin/bash

if [[ "$OSTYPE" != "darwin"* ]]; then
  echo "OSX only!"
  exit
fi

case $1 in
  0|-i)
    echo "Integrated Only"
    sudo pmset -a gpuswitch 0
    ;;
  1|-d)
    echo "Discrete Only"
    sudo pmset -a gpuswitch 1
    ;;
  2|-a|-r)
    echo "Auto Switching"
    sudo pmset -a gpuswitch 2
    ;;
  *)
    echo "Display GPU setting:"
    pmset -g | grep gpuswitch
esac

