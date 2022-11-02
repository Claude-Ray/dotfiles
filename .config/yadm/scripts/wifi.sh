#!/bin/bash

case $1 in
  up)
    nmcli radio wifi on
    ;;
  down)
    nmcli radio wifi off
    ;;
  connect)
    nmcli device wifi rescan
    nmcli device wifi $*
    ;;
  *)
    nmcli device wifi list
    ;;
esac
