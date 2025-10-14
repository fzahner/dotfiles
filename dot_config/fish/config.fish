if status is-interactive
    # Commands to run in interactive sessions can go here

    # Abbreviations
    abbr --add ost "cd ~/OneDrive/OST/"
    abbr --add pdf --set-cursor "zathura % & && disown"
    abbr --add pdfe --set-cursor "xournalpp % > /dev/null 2>&1 & && disown" # since xournalapp prints to stdout, we redirect it to keep the console clean
    abbr --add rm "trash"
    abbr --add k "kubectl"
    abbr --add dsa "docker stop \$(docker ps -a -q) "
    abbr --add --position anywhere ... "../.."
    abbr --add --position anywhere .... "../../.."
    abbr --add --position anywhere ..... "../../../.."
    abbr --add --position anywhere ...... "../../../../.."
    abbr --add pls --function sudo_last
end

set fish_greeting ""

# Set variables
## Show Done notifications for tasks that take longer than (ms)
set -U __done_min_cmd_duration 30000

# Functions
## sudo the last command
function sudo_last; echo "sudo $history[1]"; end

## open new terminal at same path as current terminal
## optional parameter: number which defines how many should be cloned
function clone-term
    set count (math "$argv[1]" 2>/dev/null)
    if test -z "$count"; set count 1; end
    set cwd (pwd)
    for i in (seq $count)
        herbstclient spawn alacritty --working-directory $cwd
    end
end

## Yazi File manager shell wrapper
## see https://yazi-rs.github.io/docs/quick-start#shell-wrapper
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

## do ls after cd
function cd --argument dir
    if [ "dir" = "" ]
        builtin cd $HOME
    else
        builtin cd $dir
    end
    ls -A
end

set -Ux fish_user_paths /opt/nvim-linux64/bin $fish_user_paths
fish_add_path /home/fabio/.spicetify
