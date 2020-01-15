#!/usr/bin/env bash

################################################################################
# Terraform Base
################################################################################
alias tf="terraform"
alias tfa="terraform apply"
alias tfd="terraform destroy"
alias tfs="terraform show"
alias tfv="terraform validate"
alias tfp="terraform plan"
alias tfi="terraform init"
alias tfu="terraform init -upgrade"

################################################################################
# Workspaces
################################################################################
alias tfw="terraform workspace"
alias tfwl="terraform workspace list"
alias tfws="terraform workspace select"
alias tfwn="terraform workspace new"
alias tfwd="terraform workspace delete"