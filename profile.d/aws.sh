#!/usr/bin/env bash

################################################################################
# CloudFormation
################################################################################
alias cf="aws cloudformation --profile $AWS_PROFILE --region $AWS_REGION "
alias cfshow="aws cloudformation describe-stacks --profile $AWS_PROFILE --region $AWS_REGION --stack-name "
alias cfstatus="aws cloudformation describe-stacks --profile $AWS_PROFILE --region $AWS_REGION --output text --query 'Stacks[*].StackStatus') --stack-name "
