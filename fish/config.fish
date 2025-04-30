if status is-interactive
    # Commands to run in interactive sessions can go here

    # Abbreviations
    abbr --add ost "cd ~/OneDrive/OST/"
    abbr --add pdf --set-cursor "zathura % & "
    abbr --add pdfe --set-cursor "xournalpp % & "
    abbr --add rm "trash"
    abbr --add dsa "docker stop $(docker ps -a -q | tr '\n' ' ') "

    # define pls to rerun previous command with sudo
    alias pls="sudo !!"
end


# pls define
function sudo --description "Replacement for Bash 'sudo !!' command to run last command using sudo."
    if test "$argv" = !!
        echo sudo $history[1]
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end

# do ls after cd
function cd --argument dir
    if [ "dir" = "" ]
        builtin cd $HOME
    else
        builtin cd $dir
    end
    ls -A
end

set -Ux fish_user_paths /opt/nvim-linux64/bin $fish_user_paths

# add starship support
# starship init fish | source
