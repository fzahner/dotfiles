#!/bin/bash

eww daemon
eww open bar

# open scripts
~/.config/eww/powermenu/launch_powermenu &
~/.config/eww/scripts/active_tag.sh &
