#!/bin/bash

sleep 2
eww daemon
sleep 2
eww open bar
sleep 1

# open scripts
~/.config/eww/powermenu/launch_powermenu
~/.config/eww/scripts/active_tag.sh &


