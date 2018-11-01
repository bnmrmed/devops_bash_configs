#!/usr/bin/env bash

# Base Command Shortcuts
##########################################################
alias l="ls"
alias rm="rm -i"
alias mv="mv -i"
alias rsync="rsync -r --rsh=ssh"
alias psg="ps -ef | grep "
alias cls="clear"
alias h="history | grep -i "
alias cdiff-ac="colordiff -yW`tput cols`"

# Update Reference Git Tag - https://github.com/bonusbits/update_reference_git_tag
if [ ! -h "/usr/local/bin/urgt" ]; then
   ln -s "$HOME/Development/github/bonusbits/update_reference_git_tag/urgt.sh" /usr/local/bin/urgt
fi
