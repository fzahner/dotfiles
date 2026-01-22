#!/bin/bash

# adapted from https://gitlab.com/gitaarik/battery-health-notifications

# This script monitors the battery status and sends notifications to the user
# It keeps track of whether the user has acknowledged high battery state notifications so they are only shown once
# Low charge notififications on the other hand are sent every time the script runs if the battery is low

# ------------ Variables ------------

BATTERY_PATH=$(upower -e | grep battery)
LINE_POWER_PATH=$(upower -e | grep line_power)
BATTERY_PERCENTAGE=$(upower -i $BATTERY_PATH | grep 'percentage:' | awk '{ print $2 }' | sed 's/%//')
CABLE_PLUGGED=$(upower -i $LINE_POWER_PATH | grep -A2 'line-power' | grep online | awk '{ print $2 }')

LOG_FILE=/var/tmp/battery/powerstatus.txt
ACK_HI_FILE="/var/tmp/battery/battery_acknowledged_high_state"

# ------------ Create file structures (if needed) ------------
mkdir -p /var/tmp/battery

# battery log
{
    echo $(date +"%Y-%m-%d %H:%M:%S")
    echo "percentage: $BATTERY_PERCENTAGE"
    echo "plugged in: $CABLE_PLUGGED"
    echo ""
} >> "$LOG_FILE"
sed -i '5001,$ d' "$LOG_FILE" # keep log file to 5000 lines max


if [[ ! -f "$ACK_HI_FILE" ]]; then
    echo "false" > "$ACK_HI_FILE"
fi

# ------------ Main Logic ------------
if [[ $CABLE_PLUGGED == 'yes' ]]; then
    if [[ $BATTERY_PERCENTAGE -gt 80 ]]; then
        if [[ $(cat "$ACK_HI_FILE") != 'true' ]]; then
            notify-send --urgency=normal -i battery "Battery optimization" "Battery reached 80%, unplug the power cable to optimize battery life."
            echo "true" > "$ACK_HI_FILE"
        fi
    fi
else

    if [[ $BATTERY_PERCENTAGE -lt 80 ]]; then
        echo "false" > "$ACK_HI_FILE" # Reset acknowledgment when battery falls below 80%
    fi
    if [[ $BATTERY_PERCENTAGE -lt 10 ]]; then
        notify-send --urgency=critical -i emblem-important "Battery low" "Battery is below 10%. Plug in the power cable."
    fi
    if [[ $BATTERY_PERCENTAGE -lt 20 ]]; then
        notify-send --urgency=normal -i battery -t 30000 "Battery optimization" "Battery is below 20%. Plug in the power cable to optimize battery life."
    fi

fi
