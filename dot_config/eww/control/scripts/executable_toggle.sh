#!/usr/bin/env bash
# Show/hide the control menu based on hover over the trigger (bar's right side) and the menu itself.
# Usage: toggle.sh <enter|leave> <trigger|menu>
EWW=eww
ANIM=0.25   # keep in sync with :duration of the revealer (250ms)
GRACE=0.3   # time allowed to move the pointer from trigger to menu

action=$1 zone=$2

hovered() { [[ $($EWW get control-hover-trigger) == true || $($EWW get control-hover-menu) == true ]]; }

if [[ $action == enter ]]; then
    $EWW update "control-hover-$zone=true"
    if ! $EWW active-windows | grep -q '^control:'; then
        $EWW update control="$(~/.config/eww/control/scripts/status.sh)"
        $EWW open control
    fi
    $EWW update control-reveal=true
    exit
fi

$EWW update "control-hover-$zone=false"
sleep "$GRACE"
hovered && exit
$EWW update control-reveal=false
sleep "$ANIM"
hovered && { $EWW update control-reveal=true; exit; }
$EWW close control 2>/dev/null
