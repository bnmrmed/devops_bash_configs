#!/usr/bin/env bash

################################################################################
# Environment Variables
################################################################################
export DOCKER_ID_USER="levonbecker"

################################################################################
# Docker
################################################################################
alias d="docker"

################################################################################
## Docker Image
################################################################################
alias di="docker image"
alias dil="docker image ls"
alias dirm="docker image remove"
alias dib="docker build"
alias dipull="docker image pull"
alias dipush="docker image push"
alias dii="docker image inspect "
alias disearch="docker search"
# created|restarting|running|removing|paused|exited|dead

################################################################################
# Docker Container
################################################################################
alias dc="docker container"
alias dcl="docker container ls"
alias dcla="docker container ls -a"
alias dcdf="docker container ls -as"
alias dcrm="docker container rm"
alias dcs="docker container stats"
alias dcsa="docker container stats -a"
alias dcstart="docker container start"
alias dcstop="docker container stop"
alias dcexec="docker container exec"
alias dcrun="docker container run"

################################################################################
# Docker System
################################################################################
alias dsdf="docker system df"
alias dsinfo="docker system info"

################################################################################
# Docker Swarm
################################################################################
# alias dswarm="docker swarm"

################################################################################
# Docker Network
################################################################################
alias dn="docker network"
alias dnl="docker network ls"
alias dni="docker network inspect"

################################################################################
# Docker Login
################################################################################
# Usage - dlogin "comet-rds"
function dlogin() {
    docker exec -it "${1}" /bin/sh
}

################################################################################
# Docker Nuke - Delete All Stopped Containers and Untagged Images
################################################################################
# function dnuke() {
#    docker ps -a -q -f status=exited -f status=dead | xargs -n1 docker rm
#    docker images | grep '^<none>' | awk '{print $3}' | xargs -n1 docker rmi
# }
alias dnuke="docker system prune -f"

################################################################################
# Docker Compose
################################################################################
alias dcomp="docker-compose"
alias dcompup="docker-compose up"
alias dcompdwn="docker-compose down"

################################################################################
# Docker Tags - List all Tags of a Docker Image in Docker Hub
################################################################################
# Usage - ditags chef/chefdk
function docker-image-tags() {
 image="$1"
 tags=`wget -q https://registry.hub.docker.com/v1/repositories/${image}/tags -O -  | sed -e 's/[][]//g' -e 's/"//g' -e 's/ //g' | tr '}' '\n'  | awk -F: '{print $3}'`

 if [ -n "$2" ]
 then
     tags=` echo "${tags}" | grep "$2" `
 fi

 echo "${tags}"
}
alias docker_image_tags=ditags
