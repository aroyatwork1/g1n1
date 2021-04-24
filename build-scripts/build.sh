#!/bin/bash

set -e

echo "Starting Build operations.............................."

VERSION=$(date +%s)
LATEST_COMMIT_HASH=$(git log -n 1 --pretty=format:"%H")
BUILD_NAME="${LATEST_COMMIT_HASH}.g1n1.${VERSION}"
G1N1_IMAGE_NAME="aroyatwork/g1n1:${BUILD_NAME}"

echo "Generating new build named ${BUILD_NAME}..............."
docker build -t ${G1N1_IMAGE_NAME} .

echo "Pushing generated docker image to docker hub..."
echo ${docker_hub_pass} | docker login --username aroyatwork --password-stdin
docker push ${G1N1_IMAGE_NAME}
rm /root/.docker/config.json
docker logout

echo ${G1N1_IMAGE_NAME} > ~/g1n1_tmp
echo "Finished Build operations.............................."