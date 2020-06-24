#!/bin/bash

if [[ "$OSTYPE" != "darwin"* ]]; then
  echo "OSX only!"
  exit
fi

case $1 in
  down)
    echo "unloading"
    sudo launchctl unload /Library/LaunchDaemons/com.sangfor.EasyMonitor.plist
    ;;
  up)
    echo "loading"
    sudo launchctl load /Library/LaunchDaemons/com.sangfor.EasyMonitor.plist
    ;;
  ps|ls|list)
    ps aux|grep [E]asyConnect
    ;;
  *)
    echo "Private script to (un)load EasyConnect"
esac

