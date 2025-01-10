#!/bin/bash

# from https://gitlab.com/gitaarik/battery-health-notifications

# Run this script as a cronjob every 5 minutes or so, to get notifications when
# battery percentage goes below 30% or above 80%.
# Cronjob line example:
# */5 * * * * /bin/bash /path/to/battery_health_notifications.sh

# This line is to make notify-send always work, also when run in a crontab.
# https://askubuntu.com/questions/298608/notify-send-doesnt-work-from-crontab/346580#346580

BATTERY_PATH=$(upower -e | grep battery)
LINE_POWER_PATH=$(upower -e | grep line_power)
BATTERY_PERCENTAGE=$(upower -i $BATTERY_PATH | grep 'percentage:' | awk '{ print $2 }' | sed 's/%//')
CABLE_PLUGGED=$(upower -i $LINE_POWER_PATH | grep -A2 'line-power' | grep online | awk '{ print $2 }')

if [[ $CABLE_PLUGGED == 'yes' ]]; then
    echo "cable is plugged"
    if [[ $BATTERY_PERCENTAGE -gt 80 ]]; then
        notify-send --urgency=normal -t 30000 "Battery optimization" "Battery reached 80%, unplug the power cable to optimize battery life."
    fi

else
    echo "cable is not plugged"
    if [[ $BATTERY_PERCENTAGE -lt 10 ]]; then
        notify-send --urgency=critical -i emblem-important "Battery low" "Battery is below 10%. Plug in the power cable."
    fi
    if [[ $BATTERY_PERCENTAGE -lt 20 ]]; then
        notify-send --urgency=normal -i battery -t 30000 "Battery optimization" "Battery is below 20%. Plug in the power cable to optimize battery life."
    fi

fi
