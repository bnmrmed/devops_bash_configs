#!/usr/bin/env bash

# Example is for Charles Proxy setup on macOS

# Docker Support for macOS
## Set Docker IP to what works locally for you
docker_proxy_ip="169.254.169.254"

# If using Charles Proxy leave otherwise add creds/host to enterprise proxy
proxy_host="localhost"
proxy_port="8888"

function proxy-check(){
    if [ "$ALL_PROXY" = "" ]; then
        echo "Shell Proxy (OFF)"
    else
        echo "Shell Proxy (ON)"
    fi
}

function proxy-show(){
    echo "ALL_PROXY = ($ALL_PROXY)"
    echo "HTTP_PROXY = ($HTTP_PROXY)"
    echo "http_proxy = ($http_proxy)"
    echo "HTTPS_PROXY = ($HTTPS_PROXY)"
    echo "https_proxy = ($https_proxy)"
    echo "ftp_proxy = ($ftp_proxy)"
    echo "rsync_proxy = ($rsync_proxy)"
    echo "no_proxy = ($no_proxy)"
    echo "NO_PROXY = ($NO_PROXY)"
}

function proxy-on(){
    if ifconfig -L lo0 | grep ${docker_proxy_ip}; then
        export ALL_PROXY=http://${docker_proxy_ip}:${proxy_port}
    else
        export ALL_PROXY=http://${proxy_host}:${proxy_port}
    fi
    export HTTP_PROXY=$ALL_PROXY
    export http_proxy=$ALL_PROXY
    export HTTPS_PROXY=$ALL_PROXY
    export https_proxy=$ALL_PROXY
    export ftp_proxy=$ALL_PROXY
    export rsync_proxy=$ALL_PROXY
    export NO_PROXY=localhost,.local,169.254.,${docker_proxy_ip},127.0.0.1,10.0.2.,192.168.25.,192.168.99.,33.33.33.,.corp.domain.com
    export no_proxy=$NO_PROXY
    proxy-check
}

function proxy-off(){
  unset HTTP_PROXY HTTPS_PROXY http_proxy https_proxy ftp_proxy rsync_proxy ALL_PROXY NO_PROXY no_proxy
  proxy-check
}

function proxy-enable-lo-alias(){
    echo "Enabling Loopback Alias for Docker..."
    if ! ifconfig -L lo0 | grep ${docker_proxy_ip}
    then
        sudo ifconfig lo0 inet alias ${docker_proxy_ip}/32
        echo "Loopback Alias Created!"
        echo "Now Reconnect VPN and Restart Charles Proxy"
    else
        echo "Loopback Alias Already Created"
    fi
}

function proxy-disable-lo-alias(){
    echo "Disabling Loopback Alias for Docker..."
    if ifconfig -L lo0 | grep ${docker_proxy_ip}; then
        sudo ifconfig lo0 inet alias ${docker_proxy_ip}
        echo "Loopback Alias Removed!"
        echo "Now Reconnect VPN and Restart Charles Proxy"
    else
        echo "Loopback Alias Already Removed"
    fi
}

function proxy-lo-show(){
    ifconfig -L lo0 | grep ${docker_proxy_ip}
}

function proxy-docker-on(){
    proxy-enable-lo-alias
    export ALL_PROXY=http://${docker_proxy_ip}:${proxy_port}
    export HTTP_PROXY=$ALL_PROXY
    export http_proxy=$ALL_PROXY
    export HTTPS_PROXY=$ALL_PROXY
    export https_proxy=$ALL_PROXY
    export ftp_proxy=$ALL_PROXY
    export rsync_proxy=$ALL_PROXY
    export NO_PROXY=localhost,.local,169.254.,${docker_proxy_ip},127.0.0.1,10.0.2.,192.168.25.,192.168.99.,33.33.33.,.corp.domain.com
    export no_proxy=$NO_PROXY
    proxy-check
}

function proxy-docker-on(){
    proxy-disable-lo-alias
    proxy-off
}

# Turn on by Default
proxy-on
export PROXY_ENV=true