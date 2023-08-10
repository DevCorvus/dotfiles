!#/bin/bash

# Disable screensaver
xset -dpms
xset s off
# Auto lock using i3lock
xautolock -detectsleep -time 10 -locker "i3lock -c 000000"
