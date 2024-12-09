#!/usr/bin/env bash

monitor=${1:-0}

# Listen for changes to tag status
herbstclient --idle | while read -r hook args; do
  if [[ $hook == tag_changed ]]; then
    # Read tag status into a variable
    tag_status=$(herbstclient tag_status)

    # Iterate through each tag and process based on its prefix
    for tag in $tag_status; do
      prefix=${tag:0:1}   # The first character (e.g., #, :, .)
      number=${tag:1}     # The rest (e.g., 1, 2, 3)
      case "$prefix" in
        "#")  # Active tag
          eww update tag-$number="tag-active"
          ;;
        ":")  # Inactive, has windows
          eww update tag-$number="tag-used"
          ;;
        ".")  # Inactive, no windows
          eww update tag-$number="tag-passive"
          ;;
        "!")  # Urgent tag
          eww update tag-$number="tag-urgent"
          ;;
        *)
          eww update tag-$number="tag-unknown"
          ;;
      esac
    done
  fi
done
