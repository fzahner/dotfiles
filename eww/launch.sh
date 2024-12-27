#!/bin/bash

sleep 2
eww daemon
sleep 2
eww open bar
sleep 1
~/.config/eww/scripts/active_tag.sh &
