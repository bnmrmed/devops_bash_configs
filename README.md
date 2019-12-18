# DevOps BASH Configuration Examples
Basic BASH Profile Configuration examples for MacOS and Linux for a DevOps Workstation. 
The configurations are focused on AWS, Docker, Chef and Test Kitchen.

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
    
## Usage
#### [aws](https://github.com/bonusbits/devops_bash_config_examples/tree/master/aws)
Skeleton AWS CLI config and credentials.

#### [iterm2](https://github.com/bonusbits/devops_bash_config_examples/tree/master/iterm2)
Ubuntu color scheme for iterm2.

#### [Profile.d](https://github.com/bonusbits/devops_bash_config_examples/tree/master/profile.d)
The shared folder has BASH scripts and settings for both Linux and macOS. Copy the profile.d directory to your home directory. move the .bash_profile to the root of the home folder. Check that .profile loads the .bash_profile. Grab the macos or linux bash profiles from the profile.d/extras folder and move to profile.d.

I have several clients and environments I work in so I have several <client name>.sh in the clients folder. I pick which ones I'm working on and add/remove to the .bash_profile for loop list. Just not enough time in the day or I'd script that too. later...

#### [Scripts](https://github.com/bonusbits/devops_bash_config_examples/tree/master/scripts)
The scripts folder has git submodules of other projects I refer to in some of the scripts. 
Basically just a copy of other github projects I think relate.

Grab examples and enter your user and account information where required.

###### Submodules
The scripts directory consists of git submodules. Meaning they are clones of other git repositories I've created.
To pull them try the following commands from the root directory.

1. ```git clone https://github.com/bonusbits/devops_bash_config_examples.git```
2. ```git config --global fetch.recurseSubmodules yes```
3. ```git submodule update --init --recursive```

Then if you want to pull updates with the **fetch.recurseSubmodules** on a regular **git pull** should work. If it doesn't try the following.
* ```git submodule foreach git pull origin master```

#### [vim](https://github.com/bonusbits/devops_bash_config_examples/tree/master/vim)
Vim config example.

## Wiki
[DevOps Workstation Setup Check List](http://www.bonusbits.com/wiki/Reference:DevOps_Workstation_Setup_Check_List)

---
