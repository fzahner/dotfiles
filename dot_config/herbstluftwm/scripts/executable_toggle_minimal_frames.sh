#!/bin/sh

# A script which toggles from a minimalist theme which only highlights current

# Get the current frame_border_width value
current_width=$(herbstclient get_attr settings.frame_border_width)

# Toggle the value
if [ "$current_width" -eq 5 ]; then
    herbstclient set frame_border_width 0
    herbstclient set frame_bg_transparent on
else
    herbstclient set frame_border_width 5
    herbstclient set frame_bg_transparent off
fi
