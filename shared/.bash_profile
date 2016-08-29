#!/usr/bin/env bash

# Load Aliases
if [ -f $HOME/.bash_aliases ]; then
  source $HOME/.bash_aliases
fi

PS1='\[\033[1;31m\]\u\[\033[1;32m\]@\[\033[1;33m\]\h \[\033[1;32m\]$PWD:\n# \[\033[0m\]'

clear
uname -n -r -m

# Kitchen-EC2 + AWS CLI Environment Variables
## Default AWS Environment Variables
export AWS_SSH_KEY_ID=levons-sandbox-uswest2
export AWS_SSH_KEY_PATH=$HOME/.ssh/bonusbits-levons-sandbox-uswest2.pem
export AWS_PROFILE=bonusbits-sandbox
export AWS_REGION=us-west-2
export AWS_VPC_ID=vpc-00000000
export AWS_SUBNET=subnet-00000000
export AWS_SECURITY_GROUP_1=sg-00000000
export AWS_SECURITY_GROUP_2=sg-00000000
export AWS_IAM_INSTANCE_PROFILE=sandbox_instance_profile

# Show Current AWS Environment Variables
function aws-show() {
	echo ''
	echo "Configured AWS Environment Variables"
	echo "--------------------------------------"
	echo "AWS_SSH_KEY_ID = $AWS_SSH_KEY_ID"
	echo "AWS_SSH_KEY_PATH = $AWS_SSH_KEY_PATH"
	echo "AWS_PROFILE = $AWS_PROFILE"
	echo "AWS_REGION = $AWS_REGION"
	echo "AWS_VPC_ID = $AWS_VPC_ID"
	echo "AWS_SUBNET = $AWS_SUBNET"
	echo "AWS_SECURITY_GROUP_1 = $AWS_SECURITY_GROUP_1"
	echo "AWS_SECURITY_GROUP_2 = $AWS_SECURITY_GROUP_2"
	echo "AWS_IAM_INSTANCE_PROFILE = $AWS_IAM_INSTANCE_PROFILE"
	echo ''
}

# List Configured AWS Environments
function aws-envs(){
    echo ''
    echo "Enter an Available Key"
    echo "----------------------"
    echo "1. bonusbits-dev-uswest2"
    echo "1. bonusbits-dev-uswest2"
    echo "3. bonusbits-prd-uswest2"
    echo "4. client01-dev-uswest2"
    echo "5. client01-prd-uswest2"
    echo "6. client02-dev-useast1"
    echo "7. client02-prd-useast1"
    echo "8. client03-prd"
}

# Set AWS Environment Variables
function aws-set(){
  # Skip if Argument is Null
  if [ -n "$1" ]
    then
      # Set Env Variable
      if [ $1 == "bonusbits-sandbox" ]
        then
          export AWS_SSH_KEY_ID=dev
          export AWS_SSH_KEY_PATH=$HOME/.ssh/accountname_dev.pem
          export AWS_PROFILE=bonusbits
          export AWS_REGION=us-west-2
          export AWS_VPC_ID=vpc-00000000
          export AWS_SECURITY_GROUP_1=sg-00000000
          export AWS_SECURITY_GROUP_2=sg-00000000
          export AWS_IAM_INSTANCE_PROFILE=default_ec2instance_role
          if [ -n "$2" -a $2 == "public" ]
            then
              export AWS_SUBNET=subnet-00000000
          else
              export AWS_SUBNET=subnet-10000000
          fi
      elif [ $1 == "prd" ]
        then
          export AWS_SSH_KEY_ID=aws_prd
          export AWS_SSH_KEY_PATH=$HOME/.ssh/aws_prd.pem
          export AWS_PROFILE=aws_prd
          export AWS_REGION=us-west-2
          export AWS_VPC_ID=vpc-11111111
          export AWS_SUBNET=subnet-11111111
          export AWS_SECURITY_GROUP_1=sg-11111111
          export AWS_SECURITY_GROUP_2=sg-11111111
          export AWS_IAM_INSTANCE_PROFILE=default_ec2instance_role
          if [ -n "$2" -a $2 == "public" ]
            then
              export AWS_SUBNET=subnet-11111111
          else
              export AWS_SUBNET=subnet-20000000
          fi
      elif [ $1 == "sandbox" ]
        then
          export AWS_SSH_KEY_ID=sandbox
          export AWS_SSH_KEY_PATH=$HOME/.ssh/sandbox.pem
          export AWS_PROFILE=sandbox
          export AWS_REGION=us-west-2
          export AWS_VPC_ID=vpc-22222222
          export AWS_SUBNET=subnet-22222222
          export AWS_SECURITY_GROUP_1=sg-22222222
          export AWS_SECURITY_GROUP_2=sg-22222222
          export AWS_IAM_INSTANCE_PROFILE=default_ec2instance_role
      else
        aws-envs
      fi
  else
    aws-envs
  fi
  # Display Env Variable Current Setting
  aws-show
}

# AWS EC2 CLI Tools
export AWS_ACCESS_KEY=
export AWS_SECRET_KEY=
export JAVA_HOME=$(/usr/libexec/java_home)
export EC2_HOME="/usr/local/ec2/ec2-api-tools-1.7.5.1"
export PATH=$PATH:$EC2_HOME/bin

# Chef
export EDITOR=/usr/bin/vim

# ChefDK
eval "$(chef shell-init bash)"

# Packer
export PATH=$PATH:$HOME/packer

# Docker
export DOCKER_CERT_PATH=$HOME/.docker/machine/machines/default
export DOCKER_HOST=tcp://192.168.99.100:2376
export DOCKER_TLS_VERIFY=1
export DOCKER_MACHINE_NAME=default

# SDK Man replaced GVM. Using for Groovy, Gradle, and Maven Version Management
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Charles Proxy
function proxify(){
  export ALL_PROXY=http://localhost:8888
  export http_proxy=$ALL_PROXY
  export HTTP_PROXY=$ALL_PROXY
  export https_proxy=$ALL_PROXY
  export HTTPS_PROXY=$ALL_PROXY
  export ftp_proxy=$ALL_PROXY
  export rsync_proxy=$ALL_PROXY
}
function noproxy(){
  unset HTTP_PROXY HTTPS_PROXY http_proxy https_proxy ftp_proxy rsync_proxy ALL_PROXY
}
function listproxy(){
  echo "ALL_PROXY = ($ALL_PROXY)"
  echo "http_proxy = ($http_proxy)"
  echo "HTTP_PROXY = ($HTTP_PROXY)"
  echo "https_proxy = ($https_proxy)"
  echo "HTTPS_PROXY = ($HTTPS_PROXY)"
  echo "ftp_proxy = ($ftp_proxy)"
  echo "rsync_proxy = ($rsync_proxy)"
}
