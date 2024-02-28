#!/bin/sh
sh ~/.config/xautolock/launch.sh &
nitrogen --restore &
picom &
unclutter &
flameshot &
redshift-gtk &
safeeyes &
indicator-sound-switcher &
alarm-clock-applet --hidden &
exec i3
