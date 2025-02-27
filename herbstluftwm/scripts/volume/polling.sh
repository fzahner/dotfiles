#!/bin/bash

amixer_output=$(amixer sget 'Master')
volume=$(awk -F'[\[\]]' '/%/ { gsub("%", "", $2); print $2; exit }' <<< "$amixer_output")

timestamp=$(date '+%Y-%m-%d %H:%M:%S')
echo "[$timestamp] Audio Volume: $volume%"

eww update audio-volume="$volume"
