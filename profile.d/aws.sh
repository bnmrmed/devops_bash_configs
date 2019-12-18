#!/usr/bin/env bash

# Kitchen-EC2
function aws-region(){
	export AWS_DEFAULT_REGION=$1
	export AWS_REGION=$1
}

function aws-clear(){
	# With varying number of SG and IAM Instance Profiles then need to be cleared in-between sets
	unset AWS_SSH_KEY_ID AWS_SSH_KEY_PATH AWS_PROFILE AWS_DEFAULT_REGION AWS_REGION AWS_VPC_ID AWS_SUBNET AWS_PUBLIC_IP
	unset AWS_IAM_INSTANCE_PROFILE_1 AWS_IAM_INSTANCE_PROFILE_2 AWS_IAM_INSTANCE_PROFILE_3 AWS_IAM_INSTANCE_PROFILE_4 AWS_IAM_INSTANCE_PROFILE_5
	unset AWS_SECURITY_GROUP_1 AWS_SECURITY_GROUP_2 AWS_SECURITY_GROUP_3 AWS_SECURITY_GROUP_4 AWS_SECURITY_GROUP_5
}

function aws-show() {
	echo ''
	echo "Configured AWS Environment Variables"
	echo "--------------------------------------"
	echo "AWS_SSH_KEY_ID = $AWS_SSH_KEY_ID"
	echo "AWS_SSH_KEY_PATH = $AWS_SSH_KEY_PATH"
	echo "AWS_PROFILE = $AWS_PROFILE"
	echo "AWS_DEFAULT_REGION = $AWS_DEFAULT_REGION"
	echo "AWS_REGION = $AWS_REGION"
	echo "AWS_VPC_ID = $AWS_VPC_ID"
	echo "AWS_SUBNET = $AWS_SUBNET"
	echo "AWS_PUBLIC_IP = $AWS_PUBLIC_IP"
	echo "AWS_IAM_INSTANCE_PROFILE_1 = $AWS_IAM_INSTANCE_PROFILE_1"
	if [ -n "$AWS_IAM_INSTANCE_PROFILE_2" ]; then	echo "AWS_IAM_INSTANCE_PROFILE_2 = $AWS_IAM_INSTANCE_PROFILE_2"; fi
	if [ -n "$AWS_IAM_INSTANCE_PROFILE_3" ]; then	echo "AWS_IAM_INSTANCE_PROFILE_3 = $AWS_IAM_INSTANCE_PROFILE_3"; fi
	if [ -n "$AWS_IAM_INSTANCE_PROFILE_4" ]; then	echo "AWS_IAM_INSTANCE_PROFILE_4 = $AWS_IAM_INSTANCE_PROFILE_4"; fi
	if [ -n "$AWS_IAM_INSTANCE_PROFILE_5" ]; then	echo "AWS_IAM_INSTANCE_PROFILE_5 = $AWS_IAM_INSTANCE_PROFILE_5"; fi
	echo "AWS_SECURITY_GROUP_1 = $AWS_SECURITY_GROUP_1";
	if [ -n "$AWS_SECURITY_GROUP_2" ]; then	echo "AWS_SECURITY_GROUP_2 = $AWS_SECURITY_GROUP_2"; fi
	if [ -n "$AWS_SECURITY_GROUP_3" ]; then	echo "AWS_SECURITY_GROUP_3 = $AWS_SECURITY_GROUP_3"; fi
	if [ -n "$AWS_SECURITY_GROUP_4" ]; then	echo "AWS_SECURITY_GROUP_4 = $AWS_SECURITY_GROUP_4"; fi
	if [ -n "$AWS_SECURITY_GROUP_5" ]; then	echo "AWS_SECURITY_GROUP_5 = $AWS_SECURITY_GROUP_5"; fi
	echo ''
}

function aws-envs(){
	echo ''
	echo "Enter an AWS Environments"
	echo "------------------------------------"
	echo "* account01 dev uswest2 private"
	echo "* account01 dev uswest2 public"
	echo "* account01 prd uswest2 private"
	echo "* account01 prd uswest2 public"
	echo "* account01 sandbox"
	echo "* account02 dev uswest2 private"
	echo "* account02 dev uswest2 public"
	echo "* account02 dev useast1 private"
	echo "* account02 dev useast1 public"
	echo "* account03 prd useast1 public"
	echo ''
}

function aws-set(){
	# Skip if Argument is Null
  	if [ -n "$1" ]; then
	    # Set Env Variable
	    if [ "$1" == "account01" ]; then
			export AWS_PROFILE=account01

			if [ "$3" == "useast1" ]; then
				aws-region 'us-east-1'
			else
				aws-region 'us-west-2'
			fi

			# Default to Prd if Nil or if PRD passed
			if [ "$2" == "sandbox" ]; then
	            aws-clear
				export AWS_SSH_KEY_ID=sandbox
        		export AWS_SSH_KEY_PATH=$HOME/.ssh/sandbox.pem
				export AWS_VPC_ID=vpc-00000000
				export AWS_SECURITY_GROUP_1=sg-00000000
				export AWS_SECURITY_GROUP_2=sg-00000000
				export AWS_IAM_INSTANCE_PROFILE_1=ec2-base
				export AWS_SUBNET=subnet-00000000
			elif [ "$2" == "dev" ]; then
	            aws-clear
				export AWS_SSH_KEY_ID=account01_dev
        		export AWS_SSH_KEY_PATH=$HOME/.ssh/account01_dev.pem
				export AWS_VPC_ID=vpc-00000000
				# Instance to Instance
				export AWS_SECURITY_GROUP_1=sg-00000000
				# Remote to Instance
				export AWS_SECURITY_GROUP_2=sg-00000000
				# EFS 01
				export AWS_SECURITY_GROUP_3=sg-00000000
				# EFS 02
				export AWS_SECURITY_GROUP_4=sg-00000000
				# RDS
				# export AWS_SECURITY_GROUP_5=sg-00000000
				export AWS_IAM_INSTANCE_PROFILE_1=ec2-base
				if [ "$4" == "public" ]; then
					# Public
					export AWS_SUBNET=subnet-00000000
					export AWS_PUBLIC_IP=true
				else
				  # Private
					export AWS_SUBNET=subnet-00000000
					export AWS_PUBLIC_IP=false
				fi
			else
	            aws-clear
				# Default to Prd if not args passed
				export AWS_SSH_KEY_ID=account01_prd
				export AWS_SSH_KEY_PATH=$HOME/.ssh/account01_prd.pem
				export AWS_VPC_ID=vpc-00000000
				# Instance to Instance
				export AWS_SECURITY_GROUP_1=sg-00000000
				# Remote to Instance
				export AWS_SECURITY_GROUP_2=sg-00000000
				# EFS Shared
				export AWS_SECURITY_GROUP_3=sg-00000000
				# # EFS 01
				# export AWS_SECURITY_GROUP_3=sg-00000000
				# # EFS 02
				# export AWS_SECURITY_GROUP_4=sg-00000000
				# RDS
				export AWS_SECURITY_GROUP_5=sg-00000000
				export AWS_IAM_INSTANCE_PROFILE_1=ec2-base
				if [ "$4" == "public" ]; then
					# Public
					export AWS_SUBNET=subnet-00000000
					export AWS_PUBLIC_IP=true
				else
					# Private
					export AWS_SUBNET=subnet-00000000
					export AWS_PUBLIC_IP=false
				fi
			fi
	    elif [ "$1" == "account02" ]; then
			export AWS_PROFILE=account02

			if [ "$3" == "useast1" ]; then
				aws-region 'us-east-1'
			else
				aws-region 'us-west-2'
			fi

			# Default to my Lab USWest2
			if [ -n "$2" -o "$2" == "dev" ]; then
	            aws-clear
				export AWS_SSH_KEY_ID=account02_dev
	        	export AWS_SSH_KEY_PATH=$HOME/.ssh/account02_dev.pem
				export AWS_PROFILE=account02
				export AWS_VPC_ID=vpc-00000000
				export AWS_SECURITY_GROUP_1=sg-00000000
				export AWS_SECURITY_GROUP_2=sg-00000000
				export AWS_IAM_INSTANCE_PROFILE_1=ec2-profile
				if [ -n "$4" -o "$4" == "public" ]; then
					# Public
					export AWS_SUBNET=subnet-00000000
					export AWS_PUBLIC_IP=true
				else
					# Private
					export AWS_SUBNET=subnet-00000000
					export AWS_PUBLIC_IP=false
				fi
			fi
	    elif [ $1 == "account03" ]; then
			export AWS_PROFILE=account03

			if [ "$3" == "useast1" ]
			  then
					aws-region 'us-east-1'
			else
				aws-region 'us-west-2'
			fi

			# Default to prd vpc
			if [ -n "$2" -o "$2" == "prd" ]; then
	            aws-clear
				export AWS_SSH_KEY_ID=account03_prd
	            export AWS_SSH_KEY_PATH=$HOME/.ssh/account03_prd.pem
				export AWS_VPC_ID=vpc-00000000
				export AWS_SECURITY_GROUP_1=sg-00000000
				export AWS_SECURITY_GROUP_2=sg-00000000
				export AWS_IAM_INSTANCE_PROFILE_1=ec2-base
				if [ -n "$4" -o "$4" == "public" ]; then
					# Public
					export AWS_SUBNET=subnet-00000000
					export AWS_PUBLIC_IP=true
				else
					# Private
					export AWS_SUBNET=subnet-00000000
					export AWS_PUBLIC_IP=false
				fi
			fi
	    else
			# List Keys if Null or Wrong
			aws-envs
		fi
	else
		aws-envs
	fi

  	# Display Env Variable Current Setting
	aws-show
}

# Default AWS Account
aws-set account01 prd uswest2 private

# AWS Completer
complete -C '/usr/local/bin/aws_completer' aws
#export PATH=/usr/local/aws/bin:$PATH

# AWS EC2 CLI Tools
# export AWS_ACCESS_KEY=
# export AWS_SECRET_KEY=
# export JAVA_HOME=$(/usr/libexec/java_home)
# export EC2_HOME="/usr/local/ec2/ec2-api-tools-1.7.5.1"
# export PATH=$PATH:$EC2_HOME/bin

# AWS Set Aliases
alias aws-set-ac01dev-private="aws-set account01 dev uswest2 private"
alias aws-set-ac01dev-public="aws-set account01 dev uswest2 public"
alias aws-set-ac01prd-private="aws-set account01 prd uswest2 private"
alias aws-set-ac01prd-public="aws-set account01 prd uswest2 public"
alias aws-set-ac02dev-private="aws-set account02 dev uswest2 private"
alias aws-set-ac02dev-public="aws-set account02 dev uswest2 public"
alias aws-set-ac03prd-public="aws-set account03 prd useast1 public"

# CFN Converter - https://github.com/bonusbits/cfn_converter
if [ ! -h "/usr/local/bin/cfnc" ]; then
	ln -s "$HOME/Development/github/bonusbits/cfn_converter/cfn-converter.rb" /usr/local/bin/cfnc
fi
