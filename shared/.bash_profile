#!/usr/bin/env bash

# Proxy Functions
if [ -f $HOME/.bash_proxy ]; then
    source $HOME/.bash_proxy
fi

# General Aliases
if [ -f $HOME/.bash_aliases ]; then
    source $HOME/.bash_aliases
fi

# AWS Account Functions
if [ -f $HOME/.bash_aws ]; then
    source $HOME/.bash_aws
fi

# CloudFormation Launcher Aliases
if [ -f $HOME/.bash_cfnl ]; then
	  source $HOME/.bash_cfnl
fi

PS1='\[\033[1;31m\]\u\[\033[1;32m\]@\[\033[1;33m\]\h \[\033[1;32m\]$PWD:\n# \[\033[0m\]'

clear
uname -n -r -m

# Chef
export EDITOR=/usr/bin/vim

# ChefDK
eval "$(chef shell-init bash)"

# Packer
export PATH=$PATH:$HOME/packer

# Docker Toolbox (Comment if Using Docker Native)
#export DOCKER_CERT_PATH=$HOME/.docker/machine/machines/default
#export DOCKER_HOST=tcp://192.168.99.100:2376
#export DOCKER_TLS_VERIFY=1
#export DOCKER_MACHINE_NAME=default

# SDK Man replaced GVM. Using for Groovy, Gradle, and Maven Version Management
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
