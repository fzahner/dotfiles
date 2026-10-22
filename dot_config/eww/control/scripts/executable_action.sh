#!/usr/bin/env bash
# Run a control menu action, then refresh the menu state immediately.

# closing the window alone leaves the bar button's "open" highlight on
close_menu() { eww close control; eww update control-open=false control-confirm=""; }

case $1 in
    wifi)   [[ $(nmcli radio wifi) == enabled ]] && nmcli radio wifi off || nmcli radio wifi on ;;
    bt)     if bluetoothctl show | grep -q 'Powered: yes'; then bluetoothctl power off
            else rfkill unblock bluetooth; bluetoothctl power on; fi ;;
    dnd)    dunstctl set-paused toggle ;;
    osk)    ~/.config/eww/topbar/scripts/toggle-keyboard.sh; sleep 0.3 ;;
    blueman) setsid -f blueman-manager ;;
    wlctl)  setsid -f kitty --class wlctl -e wlctl ;;
    # marker lives in the runtime dir, so a fresh login starts with autolock on again.
    # Pausing also stops screen blanking and DPMS; the marker keeps their old values.
    autolock) f=$XDG_RUNTIME_DIR/autolock-paused
              if [[ -e $f ]]; then
                  read -r timeout cycle dpms < "$f"
                  xset s "${timeout:-600}" "${cycle:-600}"
                  [[ $dpms == Enabled ]] && xset +dpms
                  xautolock -enable && rm -f "$f"
              else
                  xset q | awk '/timeout:/ {t=$2; c=$4} /DPMS is/ {d=$3} END {print t, c, d}' > "$f"
                  xset s off -dpms
                  xautolock -disable
              fi ;;
    lock)     close_menu; setsid -f betterlockscreen --lock blur; exit ;;
    suspend)  close_menu; setsid -f betterlockscreen --suspend blur; exit ;;
    reboot)   systemctl reboot; exit ;;
    poweroff) systemctl poweroff; exit ;;
    volume) wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ "$2%" ;;
    bright) brightnessctl -q set "$2%" ;;
    prev|play-pause|next) playerctl "$1" ;;
    notif-rm)    dunstctl history-rm "$2" ;;
    notif-clear) dunstctl history-clear ;;
esac >/dev/null 2>&1
eww update control="$(~/.config/eww/control/scripts/status.sh)"
