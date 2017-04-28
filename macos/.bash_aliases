#!/usr/bin/env bash

alias ll="ls -FalhG"

# Locate
if [ ! -h "/usr/local/bin/updatedb" ]; then
   ln -s /usr/libexec/locate.updatedb /usr/local/bin/updatedb
fi
