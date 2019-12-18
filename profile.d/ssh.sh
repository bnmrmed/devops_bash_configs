#!/usr/bin/env bash

function ssh-ec2-ubuntu (){
  if [ "$1" -a "$2" ]
  then
    ssh -o StrictHostKeyChecking=no -i "$1" ubuntu@"$2"
  fi
}
