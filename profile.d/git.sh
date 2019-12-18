#!/usr/bin/env bash

################################################################################
# Update Git Release Tag - https://github.com/bonusbits/update_reference_git_tag
################################################################################
if [ ! -h "/usr/local/bin/git-ugrt" ]; then
   ln -s "$HOME/Development/github/bonusbits/update_git_release_tag/ugrt.sh" /usr/local/bin/git-ugrt
fi

alias git-urgt-master="git-ugrt -r master -n latest"

# For Local Ruby Gem Installed from Project
# alias ugrt-master="ugrt -r master -n latest"
