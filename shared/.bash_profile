#!/usr/bin/env bash
# .bash_profile

shopt -s expand_aliases

# Load General Aliases
if [ -f $HOME/.bash_aliases ]; then
	  source $HOME/.bash_aliases
fi

# Load Proxy Functions
if [ -f $HOME/.bash_proxy ]; then
	  source $HOME/.bash_proxy
fi

# Load Profile
if [ -f $HOME/.profile ]; then
	  source $HOME/.profile
fi

# Load AWS Account Profile Settings
if [ -f $HOME/.bash_aws ]; then
    source $HOME/.bash_aws
fi

# Load CloudFormation Launcher Profile Settings
if [ -f $HOME/.bash_cfnl ]; then
	  source $HOME/.bash_cfnl
fi

# Load Chef Profile Settings
if [ -f $HOME/.bash_chef ]; then
	  source $HOME/.bash_chef
fi

# Load Kitchen Profile Settings
if [ -f $HOME/.bash_kitchen ]; then
	  source $HOME/.bash_kitchen
fi

# Load Docker Profile Settings
if [ -f $HOME/.bash_docker ]; then
	  source $HOME/.bash_docker
fi

# Load Terraform Profile Settings
if [ -f $HOME/.bash_terraform ]; then
	  source $HOME/.bash_terraform
fi

# Load Packer Profile Settings
if [ -f $HOME/.bash_packer ]; then
	  source $HOME/.bash_packer
fi

# Load SDKMan Profile Settings
if [ -f $HOME/.bash_sdkman ]; then
	  source $HOME/.bash_sdkman
fi

# Load Golang Profile Settings
if [ -f $HOME/.bash_golang ]; then
	  source $HOME/.bash_golang
fi

# Company Specific Aliases
if [ -f $HOME/.bash_client1 ]; then
	  source $HOME/.bash_client1
fi

PS1='\[\033[1;31m\]\u\[\033[1;32m\]@\[\033[1;33m\]\h \[\033[1;32m\]$PWD:\n# \[\033[0m\]'

clear
uname -n -r -m
