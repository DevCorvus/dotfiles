#!/bin/sh
setxkbmap -layout us -variant intl # Xorg keyboard
sh ~/.config/xautolock/launch.sh &
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

