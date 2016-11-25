#!/bin/bash

# Base Command Shortcuts
##########################################################
alias ls="ls"
alias l="ls"
alias rm="rm -i"
alias mv="mv -i"
alias rsync="rsync -r --rsh=ssh"
alias psg="ps -ef | grep "
alias cls="clear"
alias h="history | grep -i "

# Kitchen
##########################################################
alias kc="kitchen converge $1"
alias kcreate="kitchen create $1"
alias kd="kitchen destroy $1"
alias kdiag="kitchen diagnose $1"
alias ki="kitchen init $1"
alias kl="kitchen list"
alias klogin="kitchen login $1"
alias ks="kitchen setup $1"
alias kdebug="kitchen $1 -l debug"
alias kv="kitchen verify $1"
alias kt="kitchen test $1"
alias kexec="kitchen exec $1 -c $2"
alias kyaml="KITCHEN_YAML=$1"
alias kec2="KITCHEN_YAML=.kitchen.ec2.yml"
alias kvagrant="KITCHEN_YAML=.kitchen.vagrant.yml"
alias kdocker="KITCHEN_YAML=.kitchen.docker.yml"

# Docker
##########################################################
## Docker Machine
alias docm="docker-machine $1"
alias docmls="docker-machine ls"
function docmenv(){
  eval $(docker-machine env $1)
  echo ''
  echo -n "Docker Machine Name: "
  echo $DOCKER_MACHINE_NAME
  echo ''
}
alias docinfo="docker info"

## Docker Container
alias doc="docker $1"
alias docps="docker ps"

## Docker Service
alias docsls="docker service ls"
alias docsps="docker service ps $1"

## Docker Network
alias docnetls="docker network ls"

# Knife
##########################################################
alias k-dbsi="knife data bag show $1 $2 --secret-file $HOME/.chef/encrypted_data_bag_secret"
alias k-dbs="knife data bag show $1"
alias k-dbl="knife data bag list"
alias k-ns="knife node show $1"
alias k-nl="knife node list $1"
alias k-ne="knife node edit $1"
alias k-es="knife environment show $1"
alias k-el="knife environment list"
alias k-ee="knife environment edit $1"
alias k-rs="knife role show $1"
alias k-rl="knife role list"
alias k-re="knife role edit $1"
alias k-s="knife search node $1"
