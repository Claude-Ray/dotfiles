#!/bin/bash

case $1 in
  down)
    echo "unloading"
    if [[ "$OSTYPE" == "darwin"* ]]; then
      sudo launchctl unload /Library/LaunchDaemons/com.sangfor.EasyMonitor.plist
    elif [[ "$OSTYPE" == "linux-gnu" ]]; then
      systemctl stop EasyMonitor
    fi
    ;;
  up)
    echo "loading"
    if [[ "$OSTYPE" == "darwin"* ]]; then
      sudo launchctl load /Library/LaunchDaemons/com.sangfor.EasyMonitor.plist
    elif [[ "$OSTYPE" == "linux-gnu" ]]; then
      systemctl start EasyMonitor
    fi
    ;;
  ps|ls|list)
    ps aux|grep [E]asyConnect
    ;;
  *)
    echo "Script to (un)load EasyConnect"
esac
