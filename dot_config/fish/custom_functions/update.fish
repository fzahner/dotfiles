## update everything
function update --description "Check for distribution release upgrade or update system packages"
    # Check for release upgrade
    sudo do-release-upgrade -c
    set -l release_status $status

    if test $release_status -eq 0
        # Release available
        notify-send -u critical "System Upgrade Available" "A new release version is available! Run 'sudo do-release-upgrade' to upgrade."
    else
        # No release available
        echo -e "\nNo release upgrade found. Proceeding with package updates...\n"
        sudo apt update
        sudo apt upgrade -y
        flatpak update -y
        sudo snap refresh
    end
end
