#!/usr/bin/env bash

################################################################################
# Chef Inline Editor
################################################################################
export EDITOR=/usr/bin/vim

################################################################################
# ChefDK Shell Init
################################################################################
eval "$(chef shell-init bash)"

################################################################################
# Knife Shortcuts
################################################################################
alias k-dbsi="knife data bag show $1 $2 --secret-file $HOME/.chef/encrypted_data_bag_secret"
alias k-dbs="knife data bag show"
alias k-dbl="knife data bag list"
alias k-ns="knife node show"
alias k-nl="knife node list"
alias k-ne="knife node edit"
alias k-es="knife environment show"
alias k-el="knife environment list"
alias k-ee="knife environment edit"
alias k-rs="knife role show"
alias k-rl="knife role list"
alias k-re="knife role edit"
alias k-s="knife search node"
