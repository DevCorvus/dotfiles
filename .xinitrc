#!/bin/sh
setxkbmap -layout us -variant intl # Xorg keyboard
xset s 600 # Screensaver (10 mins)
xautolock -detectsleep -time 10 -locker "i3lock --nofork -c 000000" & # Autolock (every 10 mins)
nitrogen --restore &
picom &
unclutter &
flameshot &
redshift-gtk &
snixembed --fork & # SafeEyes dependency
safeeyes &
alarm-clock-applet --hidden &
pasystray &
exec i3

