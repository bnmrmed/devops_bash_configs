#!/usr/bin/env bash

################################################################################
# SDK Man replaced GVM. Using for Groovy, Gradle, and Maven Version Management
################################################################################
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

################################################################################
# Upgrade
################################################################################
function upgrade_sdkman (){
    echo "INFO: Upgrading SDKMan..."
    sdk selfupdate force
}
