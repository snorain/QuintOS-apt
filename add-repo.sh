#!/bin/bash

function error() {
  echo -e "$(tput setaf 1)$(tput bold)$1$(tput sgr 0)"
  exit 1
}

function warning() {
  echo -e "$(tput setaf 1)$(tput bold)$1$(tput sgr 0)"
  sleep 2
  true
}

#check that script is being run as root
if [ ! "$EUID" = 0 ]; then
    error "The script wasn't run as root!"
    echo "$(tput bold)you NEED to run this script as root!$(tput sgr 0)"
    exit 1
fi

echo -e "$(tput setaf 6)adding repo...$(tput sgr 0)"
echo ' + downloading snorain-apt.list'
sudo wget https://snorain.github.io/snorain-apt/snorain-apt.list -O /etc/apt/sources.list.d/snorain-apt.list || error "Failed to download 'snorain-apt.list'!"
echo -e "$(tput setaf 6)running apt update...$(tput sgr 0)"
echo " + sudo apt update"
sudo apt update || warning "Failed to run 'sudo apt update'! please run that"
echo -e "$(tput setaf 2)DONE!$(tput sgr 0)"
