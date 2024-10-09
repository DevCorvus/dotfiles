#!/bin/sh
sh ~/.config/xautolock/launch.sh &
nitrogen --restore &
picom &
unclutter &
flameshot &
redshift-gtk &
snixembed --fork & # SafeEyes dependency
safeeyes &
alarm-clock-applet --hidden &
exec i3

