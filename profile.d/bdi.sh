#!/usr/bin/env bash

################################################################################
# Build Docker Images - https://github.com/bonusbits/build_docker_image
################################################################################
if [ ! -h "/usr/local/bin/bdi" ]; then
   ln -s "$HOME/Development/bonusbits/build_docker_image/bdi.rb" /usr/local/bin/bdi
fi

function bdi-show() {
    echo "BDI_PATH: ($BDI_PATH)"
}

function bdi-set-path() {
    bdi_configs_path=$1

    export BDI_PATH="$bdi_configs_path"
    bdi-show
}

# Default
bdi-set-path $HOME/.bdi/bonusbits/prd/wiki

function bdigo() {
    /usr/local/bin/bdi -c "$BDI_PATH/$1.yml"
}
