#this script contains all the common functions need for other script

#Assign date variable
DATETIME=$(date +"%m%d%y_%H%M%S-%Z")

# Redirect stdout ( > ) into a named pipe ( >() ) running "tee"
exec 1> >(tee -ia /tmp/setup_ubuntu_dev_env_"$DATETIME".log)

# Redirect STDERR to STDOUT
exec 2>&1

red='\E[31m'
green='\E[32m'
yellow='\E[33m'
blue='\E[1;34m'
reset_color='\E[00m'

function echo_green {
    message=$1
    echo -e "${green}$(date): ${message}${reset_color}"
}

function echo_yellow {
    message=$1
    echo -e "${yellow}$(date): ${message}${reset_color}"
}

function echo_red {
    message=$1
    echo -e "${red}$(date): ${message}${reset_color}"
}

function echo_blue {
    message=$1
    echo -e "${blue}$(date): ${message}${reset_color}"
}

function exit_on_error {
    echo_red "<< $1 >>"
    exit 1
}

function install_apt_package {
    for package in "$@" 
    do
        echo_yellow "Installing apt package $package"
        sudo apt-get install -y "$package"
        # shellcheck disable=SC2181
        if [ $? -ne 0 ];
        then
            exit_on_error "Package $package has not installed properly"
        else
            echo_blue "Installed apt package $package"
        fi
    done
}
