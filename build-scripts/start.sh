#!/bin/bash

set -e

IP=$(hostname -I | awk '{print $1}')

echo "Starting pre-requisite  checks..........................."
echo "Running in machine with IP ${IP}"

if [ -x "$(command -v docker)" ]; then
    echo "Docker is installed"
else
    echo "*** DOCKER NOT FOUND ***"
    echo "Trying to install Docker..."
    apt-get remove docker docker-engine docker.io containerd runc
    rm -rf /var/lib/docker
    apt-get update
    apt-get install apt-transport-https ca-certificates curl gnupg lsb-release
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    apt-get update
    apt-get install docker-ce docker-ce-cli containerd.io
    echo "Installed Docker..."
fi

if [ -x "$(command -v make)" ]; then
    echo "make is installed"
else
    echo "*** MAKE NOT FOUND ***"
    echo "Trying to install make..."
    apt-get -y install make
fi

if [ -x "$(command -v zip)" ]; then
    echo "make is installed"
else
    echo "*** ZIP NOT FOUND ***"
    echo "Trying to install zip..."
    apt-get -y install zip
fi

if [ -x "$(command -v unzip)" ]; then
    echo "make is installed"
else
    echo "*** UNZIP NOT FOUND ***"
    echo "Trying to install unzip..."
    apt-get -y install unzip
fi


echo "Pre-requisite  checks done................................"