[![Project Release](https://img.shields.io/badge/release-v2.0.3-blue.svg)](https://github.com/bonusbits/bonusbits_base)
[![GitHub issues](https://img.shields.io/github/issues/bonusbits/devops_bash_configs.svg)](https://github.com/bonusbits/devops_bash_configs/issues)

# DevOps BASH Configurations
Basic BASH Profile Configuration examples for MacOS and Linux for a DevOps Workstation. 
The configurations are focused on AWS, Docker, Chef and Test Kitchen. It can give you a jump start on setting up a Linux based workstation for doing devops type of work. I mainly wrote this for myself for consulting. A quick way to get up and running with how I like things setup in BASH.

I've split up the BASH scripts into their own BASH scripts under shared. 
This makes it easier to pick and chose what you'd like or not like to load. 
Plus it makes it more organized. Although, if it's all in one or two files the shell will load faster.
So, it's up to you if you'd like to merge them together.

I have an example Linux setup script at the bottom of this article that uses the repo extensively.
[Amazon Linux DevOps Workstation Setup Check List](https://www.bonusbits.com/wiki/Reference:Amazon_Linux_DevOps_Workstation_Setup_Check_List)

## Tested Operating Systems
* MacOS Catalina (10.15.2)
    * Homebrew (2.2.1)
    * iTerm2 (3.3.7)
* Ubuntu Desktop (19.04)
* Amazon Linux 2 Workspace (4.14.154-128.181)

## Application Versions
* AWS CLI (1.16.300)
* Chef Development Kit (4.5.0)
* Docker (19.03.5)
* kitchen-docker (2.9.0)
* Kubernetes (1.15.5)
* Terraform (0.12.18)

## Setup
A lot of the scripts assume this repo is cloned to **$HOME/Development/bonusbits/devops_bash_configs**. All instructions assume this is the location. You're welcome to fork and change. Maybe someday I'll make a var yaml or something to make it more customizable.
1. Clone to ```$HOME/Development/bonusbits/devops_bash_configs```
    * ```mkdir -p $HOME/Development/bonusbits && git clone https://github.com/bonusbits/devops_bash_configs.git $HOME/Development/bonusbits/devops_bash_configs```
    
## Usage
#### [aws](https://github.com/bonusbits/devops_bash_configs/tree/master/aws)
Skeleton AWS CLI config and credentials.

#### [iterm2](https://github.com/bonusbits/devops_bash_configs/tree/master/iterm2)
Ubuntu color scheme for iterm2.

#### [Profile.d](https://github.com/bonusbits/devops_bash_configs/tree/master/profile.d)
The shared folder has BASH scripts and settings for both Linux and macOS. Copy the profile.d directory to your home directory. move the .bash_profile to the root of the home folder. Check that .profile loads the .bash_profile. Grab the macos or linux bash profiles from the profile.d/extras folder and move to profile.d.

I have several clients and environments I work in so I have several <client name>.sh in the clients folder. I pick which ones I'm working on and add/remove to the .bash_profile for loop list. Just not enough time in the day or I'd script that too. later...

1. Copy profile.d folder to your home directory
    1. ```cp -R $HOME/Development/bonusbits/devops_bash_configs/profile.d/ $HOME/profile.d```
1. Look through **profile.d/extras** profile scripts and move any that you'd like to load to the profile.d/ directory. Such as, if on macOS move homebrew.sh, macos.sh and upgrades.sh. If on linux move the linux.sh.
1. Move **.bash_profile** to root
    1. ```mv $HOME/profile.d/.bash_profile $HOME/.bash_profile```
1. Add sourcing of **.bash_profile** to .bashrc or maybe .profile if Ubuntu IF it's not already included in the system bash profile load.
    1. ```echo 'if [ -f "$HOME/.bash_profile" ]; then . $HOME/.bash_profile; fi' >> $HOME/.bashrc```

#### [Scripts](https://github.com/bonusbits/devops_bash_configs/tree/master/scripts)
The scripts folder has git submodules of other projects I refer to in some of the scripts. 
Basically just a copy of other github projects I think relate.

Grab examples and enter your user and account information where required.

###### Submodules
The scripts directory consists of git submodules. Meaning they are clones of other git repositories I've created.
To pull them try the following commands from the root directory.

1. ```git clone https://github.com/bonusbits/devops_bash_configs.git```
2. ```git config --global fetch.recurseSubmodules yes```
3. ```git submodule update --init --recursive```

Then if you want to pull updates with the **fetch.recurseSubmodules** on a regular **git pull** should work. If it doesn't try the following.
* ```git submodule foreach git pull origin master```

#### [vim](https://github.com/bonusbits/devops_bash_configs/tree/master/vim)
Vim config example.

## Wiki
[DevOps Workstation Setup Check List](http://www.bonusbits.com/wiki/Reference:DevOps_Workstation_Setup_Check_List)

---
