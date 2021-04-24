#!/bin/bash

set -e

echo "Starting Deploy operations.............................."

DEPLOYMENT_SERVER="139.59.25.64"

echo "Moving inside Artifact directory and copying files..."

cd /root/artifacts;
pwd;
rm -rf basic-flexbox;
latest_artifact=$(ls -t ./*.zip | head -n1)
unzip "${latest_artifact}"
cd basic-flexbox;
pwd;
cp ./* /var/www/html/g1n1/

echo "Restarting server..."
service nginx stop
sleep 1s
service nginx start

echo "Finished Deploy operations.............................."