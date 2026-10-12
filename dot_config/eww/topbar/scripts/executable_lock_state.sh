#!/usr/bin/env bash
# Emit caps lock state as JSON whenever it changes
last=""
while true; do
  state=$(xset q | awk '/Caps Lock:/ {printf "{\"caps\":%s}", ($4=="on")?"true":"false"}')
  if [[ $state != "$last" ]]; then
    echo "$state"
    last=$state
  fi
  sleep 0.4
done
