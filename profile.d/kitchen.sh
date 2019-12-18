#!/usr/bin/env bash

################################################################################
# Kitchen CI
################################################################################
alias kc="kitchen converge "
alias kcreate="kitchen create "
alias kd="kitchen destroy "
alias kdiag="kitchen diagnose "
alias ki="kitchen init "
alias kl="kitchen list"
alias klogin="kitchen login "
alias ks="kitchen setup "
alias kdebug="kitchen $1 -l debug"
alias kv="kitchen verify "
alias kt="kitchen test "
alias kexec="kitchen exec ${1} -c ${2}"
alias kyaml="KITCHEN_YAML="
alias kec2="KITCHEN_YAML=.kitchen.ec2.yml"
alias kvagrant="KITCHEN_YAML=.kitchen.vagrant.yml"
alias kdocker="KITCHEN_YAML=.kitchen.docker.yml"
alias kdokken="KITCHEN_YAML=.kitchen.dokken.yml"

################################################################################
# Kitchen CLI Shortcut Commands with Proxy Support
################################################################################

# function kcreate(){
#   proxy-on
#   kitchen create $1
# }
#
# # kitchen converge (Run Chef)
# function kc(){
#   proxy-off
#   kitchen converge $1
# }
#
# # kitchen destroy
# function kd(){
#   proxy-on
#   kitchen destroy $1
# }
#
# # kitchen login
# function klogin(){
#   proxy-off
#   kitchen login $1
# }
#
# # kitchen setup (Setup for Inspec Tests)
# function ks(){
#   proxy-off
#   kitchen setup $1
# }
# alias kdebug="kitchen $1 -l debug"
#
# # kitchen verify (Run Inspec Tests)
# function kv(){
#   proxy-off
#   kitchen verify $1
# }
#
# # kitchen test (Similar to kitchen test, but lacking some controls like don't destroy if fails)
# function kt(){
#   proxy-on
#   kitchen destroy $1
#   proxy-on
#   kitchen create $1
#   proxy-off
#   kitchen verify $1
#   proxy-on
#   kitchen destroy $1
# }
#
# ## No Proxy Support
# alias kdiag="kitchen diagnose $1"
# alias ki="kitchen init $1"
# alias kl="kitchen list"
# alias kdebug="kitchen $1 -l debug"
# alias kexec="kitchen exec $1 -c $2"
# alias kyaml="KITCHEN_YAML=$1"
# alias kec2="KITCHEN_YAML=.kitchen.ec2.yml"
# alias kvagrant="KITCHEN_YAML=.kitchen.vagrant.yml"
# alias kdocker="KITCHEN_YAML=.kitchen.docker.yml"
# alias kdokken="KITCHEN_YAML=.kitchen.dokken.yml"
