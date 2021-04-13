#!/bin/bash

# Redirect STDERR to STDOUT
exec 2>&1

# Color codes
red='\E[31m'
green='\E[32m'
yellow='\E[33m'
blue='\E[1;34m'
reset_color='\E[00m'

function echo_red {
    message=$1
    echo -e "${red}`date`: ${message}${reset_color}"
}

function echo_green {
    message=$1
    echo -e "${green}`date`: ${message}${reset_color}"
}

function exit_on_error {
    echo_red "<< $1 >>"
    exit 1
}

function check_file_is_exist {
    if [ ! -f "$1" ]; then
        exit_on_error "File $1 does not exists"
    else
        echo_green "RSA key has been generated properly"
    fi
}

function check_package_installed_status {
    for package in "$@" 
    do
        cowsay "Checking package status ${package}"
        status=`dpkg-query -s ${package}|grep Status|cut -d':' -f 2|xargs`
        status_installed="install ok installed"
        if [ "$status" != "$status_installed" ];
        then
            exit_on_error "Package $package has not installed properly"
        fi
    done
    echo_green "All packages are installed properly"
}

cowsay "Checking if all the packages are installed properly or not"
check_package_installed_status "cowsay" "ansible" "dkms" "git" "openjdk-11-jdk" 
cowsay "Checking RSA key generated successfully or not"
check_file_is_exist "/home/$USER/.ssh/id_rsa.pub"
echo_green "All checks complete all the applications have been configured properly"
