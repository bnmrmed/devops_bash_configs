#!/usr/bin/env bash

# Terminal Colors
export CLICOLOR=1

# Java
## Set for system
# /System/Library/Frameworks/JavaVM.framework/Versions/Current/Commands/java_home -v 1.8.0_121 --exec javac -version
## Path
# /Library/Java/JavaVirtualMachines/jdk1.8.0_121.jdk/Contents/Home
java_version=1.8.0_121
export IDEA_JDK=$(/usr/libexec/java_home -v $java_version)
export RUBYMINE_JDK=$(/usr/libexec/java_home -v $java_version)
export JDK_HOME=$(/usr/libexec/java_home -v $java_version)
export JAVA_HOME=$(/usr/libexec/java_home -v $java_version)
