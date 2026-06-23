# Define the modifier key (Mod4 = Windows/Super key)
$mainMod = SUPER

# Core Session Controls
bind = $mainMod SHIFT, R, exec, hyprctl reload
bind = $mainMod, X, killactive,

# Launch Applications
bind = $mainMod, Return, exec, kitty
bind = $mainMod, T, exec, kitty
bind = $mainMod, W, exec, firefox
bind = $mainMod SHIFT, E, exec, nautilus .
bind = $mainMod, E, exec, kitty -e yazi
bind = $mainMod, R, exec, ~/.config/rofi/launchers/type-1/launcher.sh
bind = $mainMod SHIFT CONTROL ALT, L, exec, firefox https://linkedin.com

# Wayland Native Screenshot Replacement (Replaces Flameshot)
# Note: Requires 'grim' and 'slurp' packages to be installed
bind = $mainMod SHIFT, S, exec, grim -g "$(slurp)" - | wl-copy
bind = $mainMod SHIFT CONTROL, S, exec, grim -g "$(slurp)" ~/Screenshots/$(date +'%Y-%m-%d-%H%M%S_grim.png')

# Lockscreen Replacement (Replaces betterlockscreen)
# Note: Requires 'hyprlock' to be installed
bind = $mainMod, B, exec, hyprlock

# Focusing Clients (Vim keys and Arrow keys)
bind = $mainMod, Left, movefocus, l
bind = $mainMod, Right, movefocus, r
bind = $mainMod, Up, movefocus, u
bind = $mainMod, Down, movefocus, d
bind = $mainMod, H, movefocus, l
bind = $mainMod, L, movefocus, r
bind = $mainMod, K, movefocus, u
bind = $mainMod, J, movefocus, d

# Moving Clients within Layout (Vim keys and Arrow keys)
bind = $mainMod SHIFT, Left, movewindow, l
bind = $mainMod SHIFT, Right, movewindow, r
bind = $mainMod SHIFT, Up, movewindow, u
bind = $mainMod SHIFT, Down, movewindow, d
bind = $mainMod SHIFT, H, movewindow, l
bind = $mainMod SHIFT, L, movewindow, r
bind = $mainMod SHIFT, K, movewindow, u
bind = $mainMod SHIFT, J, movewindow, d

# Resizing Active Windows (Using 20px increments)
binde = $mainMod CONTROL, H, resizeactive, -20 0
binde = $mainMod CONTROL, L, resizeactive, 20 0
binde = $mainMod CONTROL, K, resizeactive, 0 -20
binde = $mainMod CONTROL, J, resizeactive, 0 20
binde = $mainMod CONTROL, Left, resizeactive, -20 0
binde = $mainMod CONTROL, Right, resizeactive, 20 0
binde = $mainMod CONTROL, Up, resizeactive, 0 -20
binde = $mainMod CONTROL, Down, resizeactive, 0 20

# Window Layout Options
bind = $mainMod, Q, closewindow, active
bind = $mainMod SHIFT, F, togglefloating,
bind = $mainMod, M, fullscreen, 0
bind = $mainMod, P, pseudo, # Pseudotile toggle

# Layout Direction / Splicing Adapters
# Hyprland's Dwindle layout handles splits automatically.
# This toggles whether the next split splits horizontally or vertically.
bind = $mainMod, U, layoutmsg, togglesplit

# "Minimize" Windows (Leverages Hyprland's Special Workspace / Scratchpad)
bind = $mainMod, C, movetoworkspace, special
bind = $mainMod SHIFT, C, togglespecialworkspace,

# Cycling Through Active Workspaces (Tags)
bind = $mainMod, comma, workspace, e-1
bind = $mainMod, period, workspace, e+1

# Workspace Navigation (Switching Workspaces 1-9)
bind = $mainMod, 1, workspace, 1
bind = $mainMod, 2, workspace, 2
bind = $mainMod, 3, workspace, 3
bind = $mainMod, 4, workspace, 4
bind = $mainMod, 5, workspace, 5
bind = $mainMod, 6, workspace, 6
bind = $mainMod, 7, workspace, 7
bind = $mainMod, 8, workspace, 8
bind = $mainMod, 9, workspace, 9

# Move Active Window to Workspace (1-9)
bind = $mainMod SHIFT, 1, movetoworkspace, 1
bind = $mainMod SHIFT, 2, movetoworkspace, 2
bind = $mainMod SHIFT, 3, movetoworkspace, 3
bind = $mainMod SHIFT, 4, movetoworkspace, 4
bind = $mainMod SHIFT, 5, movetoworkspace, 5
bind = $mainMod SHIFT, 6, movetoworkspace, 6
bind = $mainMod SHIFT, 7, movetoworkspace, 7
bind = $mainMod SHIFT, 8, movetoworkspace, 8
bind = $mainMod SHIFT, 9, movetoworkspace, 9

# Dynamic Workspace Shifts
bind = $mainMod SHIFT, period, workspace, m+1
bind = $mainMod SHIFT, comma, workspace, m-1

# Monitor & Window Focus Cycling
bind = $mainMod, BackSpace, focusmonitor, +1
bind = $mainMod, Tab, cyclenext,
bind = $mainMod SHIFT, Tab, cyclenext, prev

# Mouse Bindings (Hold Mod and drag left/right click)
bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow

# Hardware Media Controls (Independent of shell scripts)
# Note: 'bindel' allows repeating commands and execution even on a locked screen.
bindel = , XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
bindel = , XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
bindl  = , XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
bindel = , XF86MonBrightnessUp, exec, brightnessctl set 5%+
bindel = , XF86MonBrightnessDown, exec, brightnessctl set 5%-

# Player Controls
bindl  = , XF86AudioPlay, exec, playerctl play-pause
bindl  = , XF86AudioNext, exec, playerctl next
bindl  = , XF86AudioPrev, exec, playerctl previous
