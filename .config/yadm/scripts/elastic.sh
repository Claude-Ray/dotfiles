#!/bin/bash

case $1 in
  off)
    echo "Stopping elastic stack"
    if [[ "$OSTYPE" == "darwin"* ]]; then
      brew services stop apm-server-full
      brew services stop kibana-full
      brew services stop elasticsearch-full
    fi
    ;;
  on)
    echo "Starting elastic stack"
    if [[ "$OSTYPE" == "darwin"* ]]; then
      brew services start elasticsearch-full
      brew services start kibana-full
      brew services start apm-server-full
    fi
    ;;
  *)
    echo "Script to (un)load Elastic Stack"
esac
