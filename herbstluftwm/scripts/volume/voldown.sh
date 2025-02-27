#!/bin/sh

amixer -M set Master 5%-

./polling.sh # Update volume eww variable
