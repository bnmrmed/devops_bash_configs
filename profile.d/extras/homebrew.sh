#!/usr/bin/env bash

# Bash completion has been installed to:
#   /usr/local/etc/bash_completion.d

################################################################################
# Upgrade
################################################################################
function upgrade_homebrew (){
    echo "INFO: Updating HomeBrew..."
    brew update
    echo "INFO: Upgrading HomeBrew..."
    brew upgrade
    echo "INFO: Running HomeBrew Cleanup"
    brew cleanup
}

################################################################################
# Bash
################################################################################
# chsh -s /usr/local/bin/bash

################################################################################
# AWS CLI
################################################################################
# The "examples" directory has been installed to:
#   /usr/local/share/awscli/examples

################################################################################
# Findutils
################################################################################
export PATH="$PATH:/usr/local/opt/findutils/libexec/gnubin"

################################################################################
# Nodejs
################################################################################
export PATH="$PATH:/usr/local/opt/icu4c/bin"
export PATH="$PATH:/usr/local/opt/icu4c/sbin"
export PATH="$PATH:/usr/local/etc"

################################################################################
# MySQL Client
################################################################################
export PATH="$PATH:/usr/local/opt/mysql-client/bin"

# For compilers to find mysql-client you may need to set:
export LDFLAGS="-L/usr/local/opt/mysql-client/lib"
export CPPFLAGS="-I/usr/local/opt/mysql-client/include"

# For pkg-config to find mysql-client you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/mysql-client/lib/pkgconfig"

################################################################################
# Htop
################################################################################
alias htop="sudo htop"

################################################################################
# Sphinx
################################################################################
export PATH="$PATH:/usr/local/opt/sphinx-doc/bin"

################################################################################
# Wireshark
################################################################################
# This formula only installs the command-line utilities by default.
#
# Install Wireshark.app with Homebrew Cask:
#   brew cask install wireshark
#
# If your list of available capture interfaces is empty
# (default macOS behavior), install ChmodBPF:
#   brew cask install wireshark-chmodbpf
# ==> Summary
# 🍺  /usr/local/Cellar/wireshark/3.0.1: 1,149 files, 88.6MB
# ==> Caveats
# ==> unbound
# To have launchd start unbound now and restart at startup:
#   sudo brew services start unbound
# ==> lua@5.1
# You may also want luarocks:
#   brew install luarocks
# ==> wireshark
# This formula only installs the command-line utilities by default.
#
# Install Wireshark.app with Homebrew Cask:
#   brew cask install wireshark
#
# If your list of available capture interfaces is empty
# (default macOS behavior), install ChmodBPF:
#   brew cask install wireshark-chmodbpf

################################################################################
# Sqlite
################################################################################
export PATH="$PATH:/usr/local/opt/sqlite/bin"
# For compilers to find sqlite you may neet to set:
export LDFLAGS="-L/usr/local/opt/sqlite/lib"
export CPPFLAGS="-L/usr/local/opt/sqlite/include"
# For pkg-config to find sqlite you may need to set:
export PKG_CONFIG_PATH="-L/usr/local/opt/sqlite/pkgconfig"
