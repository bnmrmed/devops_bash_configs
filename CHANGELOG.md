##CHANGE LOG
---

## 2.0.2 - 01/15/2020 - Levon Becker
* Added some basic terraform aliases 

## 2.0.1 - 12/18/2019 - Levon Becker
* Renamed folder extras to aws
* Moved .vimrc to folder named vim
* Updated Readme

## 2.0.0 - 12/17/2019 - Levon Becker
* Renamed .bash_* files to not be hidden
* Moved to a new format to clean up the home folder and org under a profile.d directory in home
* Added aem, circleci, git, java, jx, kubernetes, ruby, ssh, upgrades profiles
* Updated headers to match
* Move .bash_profile under profile.d in repo for organizational purposes, I place in root of home like normal
* Ditched the macos & linux folder. The individual configs are now in profile.d/extras/macos.sh profile.d/extras/linux.sh

## 1.2.4 - 07/12/2017 - Levon Becker
* Moved aws-clear to before sets. So when wrong args entered won't clear what is currently set until really going to reset them.

## 1.2.3 - 04/03/2017 - Levon Becker
* Added build_docker_image script and bash profile example
* Pulled latest submodules

## 1.2.2 - 04/02/2017 - Levon Becker
* Added New Docker aliases/functions
* Split-up aliases/functions more to make easy to pick and chose.
* Added some starter Terraform aliases

## 1.2.1 - 03/21/2017 - Levon Becker
* Split CFNL aliases to .bash_client1
* Added a couple Terraform aliases to .bash_aliases

## 1.2.0 - 03/16/2017 - Levon Becker
* Added Better logic to .bash_cfnl
* Small refactor of .bash_aws
* Added update reference git tag symlink to .bash_aliases
* Added update reference git tag script sub module to scripts folder.

## 1.1.1 - 11/25/2016 - Levon Becker
* Added conditional show on varying aws env vars in .bash_aws

## 1.1.0 - 11/25/2016 - Levon Becker
* Added some CFNL and CFNC Submodules to Scripts. 
* Added Improved AWS Account switching functions. 
* Moved AWS Accounts functions to .bash_aws. 
* Move proxy functions from .bash_profile to .bash_proxy
* Added .bash_cfnl examples
* Removed .aws/aws_env_manager.sh that was never finished

## 1.0.1 - 08/29/2016 - Levon Becker
* Initial Release

## 1.0.0 - 08/21/2016 - Levon Becker
* Initial Commit

- - -