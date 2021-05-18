#!/bin/sh

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

RESOLUTION=$(xrandr -q | grep ' connected' | cut -d ' ' -f3 | cut -d 'x' -f1)
[ -z $RESOLUTION ] && RESOLUTION=1920
SCREEN_SCALE=$(($RESOLUTION / 1920))

export QT_AUTO_SCREEN_SCALE_FACTOR=1
export GDK_SCALE=${SCREEN_SCALE}

(sleep 5 && xset r rate 200 60) &

xhost +SI:localuser:root &

((SCREEN_SCALE >= 2)) && xrandr --dpi 192

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
((SCREEN_SCALE >= 2)) && [[ -f ~/.Xresources-4K ]] && xrdb -merge -I$HOME ~/.Xresources-4K

if command -v fcitx &> /dev/null; then
  fcitx &
elif command -v fcitx5 &> /dev/null; then
  fcitx5 &
fi

~/.fehbg &

picom -CGb &

redshift &

(sleep 10 && dropbox-cli start) &

while xsetroot -name "`date` `uptime | sed 's/.*,//'`"
do
  sleep 1
done &

exec dbus-launch dwm
