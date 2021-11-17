#!/bin/bash

case $1 in
  up)
    nmcli radio wifi on
    ;;
  down)
    nmcli radio wifi off
    ;;
  connect)
    nmcli device wifi connect
    ;;
  *)
    nmcli device wifi list
    ;;
esac
