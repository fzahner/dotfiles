#!/bin/sh
url="$1"

# find firefox window id
win_id=$(xdotool search --onlyvisible --class "firefox" | head -n1)

if [ -z "$win_id" ]; then
  # no firefox running → start it
  firefox "$url" &
else
  # get tag of firefox window
  tag=$(herbstclient attr clients.$win_id.tag)
  # switch to that tag
  herbstclient use "$tag"
  # open link in existing firefox
  firefox --new-tab "$url"
fi
