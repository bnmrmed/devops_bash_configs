# DevOps BASH Configuration Examples

Basic BASH Profile Configuration examples for MacOS and Linux for a DevOps Workstation. 
The configurations are focused on AWS, Vagrant, Docker, Chef and Test Kitchen.

I've split up a lot of the aliases into their own BASH scripts under shared. 
This makes it easier to pick and chose what you'd like or not like to load. 
Plus it makes it more organized. Although, if it's all in one or two files the shell will load faster.
So, it's up to you if you'd like to merge them together.

## Tested Operating Systems
* MacOS (10.12.3)
    * Homebrew (1.1.10)
    * iTerm2 (3.0.14)
* Ubuntu Desktop (16.04)

## Application Versions
* Docker (17.03.0-ce)
* VirtualBox (5.1.18)
* Vagrant (1.8.6)
* Chef Development Kit (1.2.22)
* Additional Gems
    * kitchen-docker (2.6.0)
    
## Submodules
The scripts directory consists of git submodules. Meaning they are clones of other git repositories I've created.
To pull them try the following commands from the root directory.

1. ```git clone https://github.com/bonusbits/devops_bash_config_examples.git```
2. ```git config --global fetch.recurseSubmodules yes```
3. ```git submodule update --init --recursive```

Then if you want to pull updates with the **fetch.recurseSubmodules** on a regular **git pull** should work. If it doesn't try the following.
* ```git submodule foreach git pull origin master```
    
## Usage
#### [Linux](https://github.com/bonusbits/devops_bash_config_examples/tree/master/linux)
The linux folder has BASH scripts specific to RHEL/Ubuntu that will not work on macOS.

#### [macOS](https://github.com/bonusbits/devops_bash_config_examples/tree/master/macos)
The macOS folder has BASH scripts and settings specific to macOS that may or may not work correctly on linux flavors.

#### [Shared](https://github.com/bonusbits/devops_bash_config_examples/tree/master/shared)
The shared folder has BASH scripts and settings for both Linux and macOS.

#### [Scripts](https://github.com/bonusbits/devops_bash_config_examples/tree/master/scripts)
The scripts folder has git submodules of other projects I refer to in some of the scripts. 
Basically just a copy of other github projects I think relate.

Grab examples and enter your user and account information where required.

## Wiki
[DevOps Workstation Setup Check List](http://www.bonusbits.com/wiki/Reference:DevOps_Workstation_Setup_Check_List)

---
