#!/bin/bash

systemctl --user import-environment PATH DISPLAY XDG_RUNTIME_DIR

systemctl --user enable --now   $HOME/.config/herbstluftwm/services/battery/batteryCheck.service
systemctl --user enable --now   $HOME/.config/herbstluftwm/services/battery/batteryCheck.timer

systemctl --user enable --now   $HOME/.config/herbstluftwm/services/volume/volumeCheck.service
systemctl --user enable --now   $HOME/.config/herbstluftwm/services/volume/volumeCheck.timer
