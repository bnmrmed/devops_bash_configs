#!/usr/bin/env bash

################################################################################
# CloudFormation Launcher - https://github.com/bonusbits/cfn_launcher
################################################################################
if [ ! -h "/usr/local/bin/cfnl" ]; then
   ln -s "/Users/levon/Development/github/bonusbits/cfn_launcher/cfnl.sh" /usr/local/bin/cfnl
fi

################################################################################
# Shortcuts
################################################################################
function cfnl-show() {
    echo "CFNL_PATH: ($CFNL_PATH)"
}

function cfnl-set-path() {
    cfnl_configs_path=$1

    export CFNL_PATH="$cfnl_configs_path"
    cfnl-show
}

function cfc() {
    # echo "Running Create Stack (/usr/local/bin/cfnl -f ${CFNL_PATH}/${1}.yml)"
    /usr/local/bin/cfnl -f "$CFNL_PATH/$1.yml"
}

function cfu() {
    # echo "Running Update Stack (/usr/local/bin/cfnl -u -f ${CFNL_PATH}/${1}.yml)"
    /usr/local/bin/cfnl -u -f "$CFNL_PATH/$1.yml"
}

function cfd() {
    # echo "Running Delete Stack (/usr/local/bin/cfnl -d -f ${CFNL_PATH}/${1}.yml)"
    /usr/local/bin/cfnl -d -f "$CFNL_PATH/$1.yml"
}

function cfs() {
    # echo "Running Stack Status (/usr/local/bin/cfnl -s -f ${CFNL_PATH}/${1}.yml)"
    /usr/local/bin/cfnl -s -f "$CFNL_PATH/$1.yml"
}

