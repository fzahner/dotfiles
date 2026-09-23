#!/usr/bin/env bash
# Run a control menu action, then refresh the menu state immediately.
case $1 in
    wifi)   [[ $(nmcli radio wifi) == enabled ]] && nmcli radio wifi off || nmcli radio wifi on ;;
    bt)     if bluetoothctl show | grep -q 'Powered: yes'; then bluetoothctl power off
            else rfkill unblock bluetooth; bluetoothctl power on; fi ;;
    dnd)    dunstctl set-paused toggle ;;
    osk)    ~/.config/eww/topbar/scripts/toggle-keyboard.sh; sleep 0.3 ;;
    blueman) setsid -f blueman-manager ;;
    mute)   wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle ;;
    mic)    wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle ;;
    volume) wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ "$2%" ;;
    bright) brightnessctl -q set "$2%" ;;
    prev|play-pause|next) playerctl "$1" ;;
esac >/dev/null 2>&1
eww update control="$(~/.config/eww/control/scripts/status.sh)"
