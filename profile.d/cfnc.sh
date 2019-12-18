#!/usr/bin/env bash

################################################################################
# CloudFormation Converter - https://github.com/bonusbits/cfn_converter
################################################################################
if [ ! -h "/usr/local/bin/cfnc" ]; then
	ln -s "$HOME/Development/bonusbits/cfn_converter/cfn-converter.rb" /usr/local/bin/cfnc
fi
