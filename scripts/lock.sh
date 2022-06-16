#!/bin/bash
scrot /tmp/screen.png
convert /tmp/screen.png -scale 10% -scale 1000% /tmp/screen.png
[[ -f ~/scripts/media/lock.png ]] && convert /tmp/screen.png ~/scripts/media/lock.png -gravity center -composite -matte /tmp/screen.png
i3lock -n -i /tmp/screen.png
rm /tmp/screen.png
