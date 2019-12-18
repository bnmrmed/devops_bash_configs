#!/usr/bin/env bash

################################################################################
# Macos Specific
################################################################################
export CLICOLOR=1

function reset-bluetooth {
    # https://apple.stackexchange.com/questions/251842/how-to-restart-bluetooth-service-from-command-line
    echo 'INFO: Stopping Bluetooth Daemon...'
    sudo launchctl stop com.apple.bluetoothd
    sleep 5
    echo 'INFO: Starting Bluetooth Daemon...'
    sudo launchctl start com.apple.bluetoothd
}


################################################################################
# macOS specific Bash Aliases
################################################################################
alias ll="ls -FalhG"


################################################################################
# Backup - https://github.com/bonusbits/backup_macos
################################################################################
if [ ! -h "/usr/local/bin/backupmacos" ]; then
   ln -s "/Users/levon/Development/github/bonusbits/backup_macos/backup_macos.sh" /usr/local/bin/backupmacos
fi
alias backupmacos-all="sudo backupmacos -d /Volumes/Seagate_1.5TB/Backups -r 60 -m 500000"
alias backupmacos-users="sudo backupmacos -u -d /Volumes/Seagate_1.5TB/Backups -r 60 -m 500000"
