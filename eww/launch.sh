#!/usr/bin/env bash

echo "debug1"

eww daemon
eww open bar
sleep 2
~/.config/eww/scripts/active_tag.sh &
