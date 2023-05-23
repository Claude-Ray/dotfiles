#!/bin/sh

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

RESOLUTION=$(xdpyinfo | awk '/dimensions/{print $2}' | cut -d 'x' -f1)
[ -z $RESOLUTION ] && RESOLUTION=1920
SCREEN_SCALE=$(($RESOLUTION / 1920))
((RESOLUTION == 3000)) && SCREEN_SCALE=2

export QT_AUTO_SCREEN_SCALE_FACTOR=1
export GDK_SCALE=${SCREEN_SCALE}
if ((SCREEN_SCALE >= 2)); then
  export GDK_DPI_SCALE=0.5
  # Would be overwritten by ~/.config/chrome-flags.conf
  export CHROME_USER_FLAGS="--force-device-scale-factor=2.0"
  export CHROMIUM_USER_FLAGS="--force-device-scale-factor=2.0"
fi

(sleep 5 && xset r rate 200 80) &

xhost +SI:localuser:root &

((SCREEN_SCALE >= 2)) && xrandr --dpi 192

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
((SCREEN_SCALE >= 2)) && [[ -f ~/.Xresources-4K ]] && xrdb -merge -I$HOME ~/.Xresources-4K

~/.fehbg &

picom -CGb &

redshift &

(sleep 10 && dropbox-cli start) &

# %wheel ALL=(ALL) NOPASSWD: /usr/bin/systemctl restart xkeysnail
(sleep 1 && sudo systemctl restart xkeysnail) &

xautolock -time 10 -corners +00- -locker slock &

while xsetroot -name "`date` `uptime | sed 's/.*,//'`"
do
  sleep 1
done &

exec dbus-launch dwm
