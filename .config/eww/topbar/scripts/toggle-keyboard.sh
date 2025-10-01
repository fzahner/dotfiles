#!/bin/bash

# Check if "onboard" is running
if pgrep -x "onboard" > /dev/null; then
    # If onboard is running, kill it
    pkill onboard
else
    # If onboard is not running, start it with the specified parameters
    onboard -s 1500x500 -y 920 -x 550 &
fi
