#!/bin/bash

eww daemon
eww open bar


# kill previous instances of active_tag.sh
pkill -f "active_tag.sh"

# open scripts
~/.config/eww/topbar/scripts/active_tag.sh &
