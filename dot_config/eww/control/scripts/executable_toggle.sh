#!/usr/bin/env bash
# Open/close the control menu (bar button).
EWW=eww

if $EWW active-windows | grep -q '^control:'; then
    $EWW close control
    $EWW update control-open=false
    $EWW update control-confirm=""
else
    $EWW update calendar-offset=0
    $EWW update control="$(~/.config/eww/control/scripts/status.sh)"
    $EWW open control
    $EWW update control-open=true
fi
