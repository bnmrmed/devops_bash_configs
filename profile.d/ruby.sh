#!/usr/bin/env bash

################################################################################
# Gemfile.lock update commands
################################################################################
# Need to research somemore. Can't just do local.. but if do update it pulls rubygem.org latest versions...
# If I do update then local, it seems to fix.. not sure. Looks like if I delete the lock then do local it works as expected
alias gemlock-update="bundle lock --update"
alias gemlock-local="bundle lock --local"
alias gemlock="rm -f Gemfile.lock && bundle lock --local"
