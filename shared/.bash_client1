#!/usr/bin/env bash

# Client 1 Specific Aliases - Or Could be Account Specific

# CloudFormation Launcher CFNL Path Aliases

# US WEST 2
## Client01

### Account01
#### DEV
##### Project01
alias set-cfnl-uw2-client01-ac01-dev-project01="aws-set-ac01dev-public && cfnl-set-path $HOME/.cfnl/uswest2/client01/account01/dev/project01"
##### Project02
alias set-cfnl-uw2-client01-ac01-dev-project02="aws-set-ac01dev-public && cfnl-set-path $HOME/.cfnl/uswest2/client01/account01/dev/project02"
##### Shared
alias set-cfnl-uw2-client01-ac01-dev-shared="aws-set-ac01dev-public && cfnl-set-path $HOME/.cfnl/uswest2/client01/account01/dev/shared"

#### PRD
##### Project01
alias set-cfnl-uw2-client01-ac01-prd-project01="aws-set-ac01prd-public && cfnl-set-path $HOME/.cfnl/uswest2/client01/account01/prd/project01"
##### Project02
alias set-cfnl-uw2-client01-ac01-prd-project02="aws-set-ac01prd-public && cfnl-set-path $HOME/.cfnl/uswest2/client01/account01/prd/project02"
##### Shared
alias set-cfnl-uw2-client01-ac01-prd-shared="aws-set-ac01prd-public && cfnl-set-path $HOME/.cfnl/uswest2/client01/account01/prd/shared"

### Account02
#### DEV
##### Project01
alias set-cfnl-uw2-client01-ac02-dev-project01="aws-set-ac02dev-public && cfnl-set-path $HOME/.cfnl/uswest2/client01/account02/prd/project01"

# Usage
## Folder Structure
# $HOME/.cfnl/
#└── uswest2
#    └── client01
#        └── account01
#            ├── dev
#            │   ├── project01
#            │   │   └── efs.yml
#            │   │   └── rds-snapshot.yml
#            │   │   └── web.yml
#            │   ├── shared
#            │   │   └── vpc.yml
#            │   │   └── utm.yml
#            │   └── project02
#            │       ├── efs.yml
#            │       └── rds-snapshot.yml
#            │       └── web.yml
#            └── prd
#                ├── project01
#                │   ├── efs.yml
#                │   ├── rds.yml
#                │   └── web.yml
#                ├── shared
#                │   ├── vpc.yml
#                │   └── utm.yml
#                └── project02
#                    ├── efs.yml
#                    ├── rds.yml
#                    ├── web-blue.yml
#                    └── web-green.yml

# Example Usage
## Set CFNL Path
#cfnl-set-path $HOME/.cfnl/uswest2/client01/account01/dev/project01
## CFNL is now set to use $HOME/.cfnl/uswest2/client01/account01/dev/project01/*.yml
#
## Create Stack (web.yml)
#cfc web
## Delete Stack (web.yml)
#cfd web
## Update Stack (web.yml)
#cfu web
