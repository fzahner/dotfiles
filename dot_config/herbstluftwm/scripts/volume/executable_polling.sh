#!/bin/bash

amixer_output=$(amixer sget 'Master')
volume=$(amixer sget Master | awk -F'[][]' '/%/ { gsub("%", "", $2); print $2; exit }')

timestamp=$(date '+%Y-%m-%d %H:%M:%S')
echo "[$timestamp] Audio Volume: $volume%"

eww update audio-volume="$volume"
