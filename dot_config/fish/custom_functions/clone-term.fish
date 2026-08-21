## open new terminal at same path as current terminal
## optional parameter: number which defines how many should be cloned
function clone-term
    set count (math "$argv[1]" 2>/dev/null)
    if test -z "$count"; set count 1; end
    set cwd (pwd)
    for i in (seq $count)
        if set -q HYPRLAND_INSTANCE_SIGNATURE; or test "$XDG_CURRENT_DESKTOP" = "Hyprland"
            hyprctl dispatch 'hl.dsp.exec_cmd("kitty -d '"$cwd"'")'
        else if test "$DESKTOP_SESSION" = "herbstluftwm"; or command -q herbstclient
            herbstclient spawn kitty $cwd
        end
    end
end
