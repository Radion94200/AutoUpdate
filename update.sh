#!/bin/sh

RED='\033[0;031m'
GREEN='\033[0;032m'
YELLOW='\033[0;033m'
NC='\033[0m'

while true
do
    echo "${YELLOW}";
    date +"%D %T";
    echo "${NC}";

    echo "Password" | sudo -S apt update && sudo apt upgrade -y;
    if [ $? -ne 0 ]
    then
        echo "${RED} --- ERROR DURING THE UPDATE ---${NC}";
    else
        echo "${GREEN} --- UPDATE IS DONE WITH SUCCESS---${NC}";
    fi

    sudo apt-get clean && sudo apt-get auto-remove -y;
    if [ $? -ne 0 ]
    then
        echo "${RED} --- ERROR DURING REMOVING PACKAGES ---${NC}";
    else
        echo "${GREEN} --- REMOVING PACKAGES IS DONE WITH SUCCESS ---${NC}";
    fi

    sleep 86400;
done
