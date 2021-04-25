#!/bin/bash

set -e

echo "Starting Deploy operations.............................."
G1N1_IMAGE_NAME=$(cat ~/g1n1_tmp)

echo "Pulling exported image ${G1N1_IMAGE_NAME} from docker hub..."
echo "${docker_hub_pass}" | docker login --username aroyatwork --password-stdin
docker pull "${G1N1_IMAGE_NAME}"

echo "Starting docker container..."
LATEST_G1N1_IMAGE=$(docker images | grep "g1n1" | awk '{print $3}')
docker run --name g1n1 -p 80:80 -d "${LATEST_G1N1_IMAGE}"

rm ~/g1n1_tmp
docker logout

sleep 5
echo "Finished Deploy operations.............................."
