#!/bin/bash

# Usage

function usage () {
usageMessage="
AWS ENV MANAGER SCRIPT

Usage: aem [switches] [--] [programfile] [arguments]
  -p, --profile   AWS Account or Profile Name
  -e, --env       AWS Environment. Usually related to a VPC
  -r, --region    AWS Region

$0 -p 'bonusbits' -e 'dev' -r 'us-west-2'
$0 --profile 'stelligent-labs' -e 'levons-lab' -r 'us-west-2'

-----------------------------------------------------------------------------------------------------------------------
"
    echo "$usageMessage";
}

# Help

function help () {
usageMessage="
AWS ENV MANAGER SCRIPT

VERSION:  1.0.0
AUTHOR:   Levon Becker
PURPOSE:  Switch Between Different AWS Configurations for AWS CLI and Test Kitchen
-----------------------------------------------------------------------------------------------------------------------
PARAMETERS
-----------------------------------------------------------------------------------------------------------------------
-a AWS Account

-----------------------------------------------------------------------------------------------------------------------
EXAMPLES
-----------------------------------------------------------------------------------------------------------------------
$0 -p 'bonusbits'
$0 -p 'stelligent-labs'

-----------------------------------------------------------------------------------------------------------------------
"
    echo "$usageMessage";
}

# Arguments

    while getopts "p:profile:h" opts; do
        case $opts in
            p ) profile=$OPTARG;;
            profile ) profile=$OPTARG;;
            h ) help; exit 0;;
            * ) usage; exit 1;;
        esac
    done

    # Use defaults if missing arguments
#    if [ -z $org ]
#    then
#    	org=home
#    fi

echo $profile