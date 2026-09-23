#!/usr/bin/env bash
# Print the control menu's state as one JSON object.

vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>/dev/null)
mic=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ 2>/dev/null)
ssid=$(nmcli -t -f NAME,TYPE connection show --active 2>/dev/null | awk -F: '$2 ~ /wireless/ {print $1; exit}')

jq -nc \
  --arg vol "$(awk '{printf "%d", $2 * 100 + 0.5}' <<<"$vol")" \
  --arg vol_muted "$([[ $vol == *MUTED* ]] && echo true || echo false)" \
  --arg mic_muted "$([[ $mic == *MUTED* ]] && echo true || echo false)" \
  --arg bright "$(brightnessctl -m 2>/dev/null | cut -d, -f4 | tr -d %)" \
  --arg wifi "$([[ $(nmcli radio wifi) == enabled ]] && echo true || echo false)" \
  --arg ssid "$ssid" \
  --arg bt "$(bluetoothctl show 2>/dev/null | grep -q 'Powered: yes' && echo true || echo false)" \
  --arg dnd "$(dunstctl is-paused 2>/dev/null)" \
  --arg osk "$(pgrep -x onboard >/dev/null && echo true || echo false)" \
  --arg player "$(playerctl status 2>/dev/null)" \
  --arg title "$(playerctl metadata title 2>/dev/null)" \
  --arg artist "$(playerctl metadata artist 2>/dev/null)" \
  '{vol: ($vol|tonumber? // 0), vol_muted: ($vol_muted == "true"), mic_muted: ($mic_muted == "true"),
    bright: ($bright|tonumber? // 0), wifi: ($wifi == "true"), ssid: $ssid, bt: ($bt == "true"),
    dnd: ($dnd == "true"), osk: ($osk == "true"), player: $player, title: $title, artist: $artist}'
