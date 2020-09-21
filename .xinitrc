#!/bin/sh

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

xset r rate 200 60

xhost +SI:localuser:root

fcitx &

exec dwm
