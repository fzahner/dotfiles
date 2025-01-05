#!/usr/bin/env bash

# Infinite loop to execute the battery check script every 10 minutes
while true; do
    ~/.config/herbstluftwm/scripts/battery/battery_health_check.sh # Path to the script to be executed
    sleep 600                     # Wait 600 seconds (10 minutes)
done
