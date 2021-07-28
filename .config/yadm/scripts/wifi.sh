#!/bin/bash

case $1 in
  up)
    nmcli radio wifi on
    ;;
  down)
    nmcli radio wifi off
    ;;
esac
