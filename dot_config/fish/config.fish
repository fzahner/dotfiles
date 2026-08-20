if status is-interactive
    # Commands to run in interactive sessions can go here

    # Abbreviations
    abbr --add pdf --set-cursor "zathura % & disown"
    abbr --add pdfe --set-cursor "xournalpp % > /dev/null 2>&1 & && disown" # since xournalapp prints to stdout, we redirect it to keep the console clean
    abbr --add rm "trash"
    abbr --add k "kubectl"
    abbr --add --position anywhere ... "../.."
    abbr --add --position anywhere .... "../../.."
    abbr --add --position anywhere ..... "../../../.."
    abbr --add --position anywhere ...... "../../../../.."
    abbr --add pls --function sudo_last
    abbr --add ct "clone-term"

    ## Docker abbreviations
    abbr --add dsa "docker stop \$(docker ps -a -q) "
    abbr --add dda "docker rm \$(docker ps -a -q) "
    abbr --add ddav "docker volume rm \$(docker volume ls -q) "
    abbr --add dcu "docker compose up"
end

set fish_greeting ""

# Set variables
## Show Done notifications for tasks that take longer than (ms)
set -U __done_min_cmd_duration 30000
## Options for Ctrl-Alt-F fzf file search
set fzf_fd_opts --hidden --no-ignore

# Functions
## sudo the last command
function sudo_last; echo "sudo $history[1]"; end

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


# Load additional environment variables (secrets)
source ~/.config/env/env.fish

# Source custom functions
set -p fish_function_path ~/.config/fish/custom_functions


# Add path variables like this:
# set -Ux fish_user_paths /opt/nvim-linux64/bin $fish_user_paths  # Neovim


# Added by Antigravity CLI installer
set -gx PATH "/home/fabioz/.local/bin" $PATH
