#!/bin/bash

backnumber=$(ls -t ~/.config/i3/wallpapers | grep background | wc -l)

randnumber=$(expr $RANDOM % $backnumber + 1)

randfile=$(ls -t .config/i3/wallpapers | grep -m$randnumber background | tail -n1)

feh --bg-fill ~/.config/i3/$randfile

