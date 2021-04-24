#!/bin/bash

set -e

IP=$(hostname -I | awk '{print $1}')

echo "Starting pre-requisite  checks..........................."
echo "Running in machine with IP ${IP}"

if [ -x "$(command -v docker)" ]; then
    echo "Docker is installed"
else
    echo "*** DOCKER NOT FOUND ***"
    exit 1
fi

echo "Pre-requisite  checks done................................"