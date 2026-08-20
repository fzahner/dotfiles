## open new terminal at same path as current terminal
## optional parameter: number which defines how many should be cloned
function clone-term
    set count (math "$argv[1]" 2>/dev/null)
    if test -z "$count"; set count 1; end
    set cwd (pwd)
    for i in (seq $count)
        hyprctl dispatch 'hl.dsp.exec_cmd("kitty -d '"$cwd"'")'
    end
end
