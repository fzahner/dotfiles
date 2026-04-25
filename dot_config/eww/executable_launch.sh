#!/bin/bash

# Force the GTK backend to X11 and clear Wayland variables
export GDK_BACKEND=x11
unset XDG_SESSION_TYPE
unset WAYLAND_DISPLAY

eww open bar

# Kill previous instances of active_tag.sh
pkill -f "active_tag.sh"

# Open scripts
~/.config/eww/topbar/scripts/active_tag.sh &
