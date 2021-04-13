red='\E[31m'
green='\E[32m'
yellow='\E[33m'
blue='\E[1;34m'
reset_color='\E[00m'

function echo_green {
    message=$1
    echo -e "${green}`date`: ${message}${reset_color}"
}

function echo_yellow {
    message=$1
    echo -e "${yellow}`date`: ${message}${reset_color}"
}

function echo_red {
    message=$1
    echo -e "${red}`date`: ${message}${reset_color}"
}

function echo_blue {
    message=$1
    echo -e "${blue}`date`: ${message}${reset_color}"
}
