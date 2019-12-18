#!/usr/bin/env bash

java_version=1.8.0_121
export IDEA_JDK=$(/usr/libexec/java_home -v $java_version)
export RUBYMINE_JDK=$(/usr/libexec/java_home -v $java_version)
export JDK_HOME=$(/usr/libexec/java_home -v $java_version)
export JAVA_HOME=$(/usr/libexec/java_home -v $java_version)
