#!/bin/bash

sleep 5
eww daemon
sleep 2
eww open bar
sleep 2
~/.config/eww/scripts/active_tag.sh &
