#!/bin/bash

set -e

echo "Starting Deploy operations.............................."

DEPLOYMENT_SERVER="139.59.25.64"
G1N1_IMAGE_NAME=$(cat ~/g1n1_tmp)

echo "Moving inside Artifact directory and copying files..."

cd /root/artifacts;
pwd;
rm -rf basic-flexbox;
latest_artifact=$(ls -t ./*.zip | head -n1)
unzip "${latest_artifact}"
cd basic-flexbox;
pwd;
cp ./* /var/www/html/g1n1/

echo "Pulling exported image ${G1N1_IMAGE_NAME} from docker hub..."
echo ${docker_hub_pass} | docker login --username aroyatwork --password-stdin
docker pull ${G1N1_IMAGE_NAME}

echo "Restarting server..."
service nginx stop
sleep 1s
service nginx start

rm ~/g1n1_tmp
docker logout

echo "Finished Deploy operations.............................."