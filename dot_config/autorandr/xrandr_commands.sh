# xrandr --dpi 118
xrandr --output eDP-1 --mode 2560x1440 --pos 440x1440 --primary

# OST Widescreen setup
# above +
# xrandr --output DP-1 --mode 3440x1440 --pos 0x0

# Home Setup
# above +
xrandr --output DP-2 --scale 1.25x1.25 --mode 1920x1080 --pos 0x0

# OST SA Room
# above +
# xrandr --output DP-1  --mode 1920x1080 --pos 0x0

# Widescreen setup with third monitor
xrandr --output eDP-1 --mode 2560x1440 --pos 2360x1440 --primary
xrandr --output DP-1 --mode 3440x1440 --pos 1920x0
xrandr --output DP-2 --mode 1920x1080 --pos 0x360
