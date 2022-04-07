#!/bin/bash

init() {
  # Initial script executed after installation.
  # Fix the directory permission to be able to save user settings.
  CONF_PATH=/usr/share/sangfor/EasyConnect/resources/conf/
  sudo chmod -R 777 $CONF_PATH
  # Skip the version check to avoid "Error: version does not match the server version".
  [[ ! -f $CONF_PATH/pkg_version.xml.old ]] && mv $CONF_PATH/pkg_version.xml $CONF_PATH/pkg_version.xml.old
  echo -e '<?xml version="1.0" encoding="utf-8"?>\n<root></root>' > $CONF_PATH/pkg_version.xml
  # TODO: Prevent easyconnect from modifying the pkg_version.xml
  chmod 444 /usr/share/sangfor/EasyConnect/resources/conf/pkg_version.xml
}

dns() {
  cat /etc/resolv.conf.sangforbak | sudo tee -a /etc/resolv.conf
}

down() {
  killall EasyConnect
  if [[ "$OSTYPE" == "darwin"* ]]; then
    sudo launchctl unload /Library/LaunchDaemons/com.sangfor.EasyMonitor.plist
    killall Authy\ Desktop
    if [ -f /Library/LaunchAgents/com.sangfor.ECAgentProxy.plist ]; then
      sudo rm /Library/LaunchAgents/com.sangfor.ECAgentProxy.plist
      launchctl remove com.sangfor.ECAgentProxy
    fi
  elif [[ "$OSTYPE" == "linux-gnu" ]]; then
    systemctl stop EasyMonitor
  fi
}

up() {
  if [[ "$OSTYPE" == "darwin"* ]]; then
    sudo launchctl load /Library/LaunchDaemons/com.sangfor.EasyMonitor.plist
    open -g -a EasyConnect
    open -a Authy\ Desktop
  elif [[ "$OSTYPE" == "linux-gnu" ]]; then
    systemctl start EasyMonitor
    # wmctrl -xa EasyConnect
  fi
}

case $1 in
  init)
    init
    ;;
  dns)
    dns
    ;;
  fix)
    init
    [[ -f /etc/resolv.conf.sangforbak ]] && dns
    echo "done"
    ;;
  down)
    echo "unloading"
    down
    ;;
  up)
    echo "loading"
    up
    ;;
  ps|ls|list)
    ps aux|grep [E]asyConnect
    ;;
  *)
    echo "Script to (un)load EasyConnect"
esac
