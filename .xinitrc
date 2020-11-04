#!/bin/sh

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

(sleep 5 && xset r rate 200 60) &

xhost +SI:localuser:root &

fcitx &

~/.fehbg &

picom -CGb &

redshift &

(sleep 10 && dropbox-cli start) &

while xsetroot -name "`date` `uptime | sed 's/.*,//'`"
do
    sleep 1
done &

exec dbus-launch dwm
