#!/bin/bash

set -e

echo "Starting Deploy operations.............................."

DEPLOYMENT_SERVER="139.59.25.64"

echo "Moving inside Artifact directory and copying files..."
sshpass -p ${slave_pass} ssh root@${DEPLOYMENT_SERVER} "ls -lash; cd artifacts; pwd; unzip $(ls -t *.zip | head -n1); cd basic-flexbox; pwd; cp * /var/www/g1n1/"

echo "Restarting server..."
sshpass -p ${slave_pass} ssh root@${DEPLOYMENT_SERVER} service nginx stop
sleep 1s
sshpass -p ${slave_pass} ssh root@${DEPLOYMENT_SERVER} service nginx start

echo "Finished Deploy operations.............................."