#!/bin/bash

set -e

echo "Starting Build operations.............................."

VERSION=$(date +%s)
LATEST_COMMIT_HASH=$(git log -n 1 --pretty=format:"%H")
BUILD_NAME="${LATEST_COMMIT_HASH}.g1n1.${VERSION}"

echo "Generating new build named ${BUILD_NAME}..............."
docker build -t "aroyatwork/g1n1:${BUILD_NAME}" .

echo "Pushing generated docker image to docker hub..."
echo ${docker_hub_pass} | docker login --username aroyatwork --password-stdin
docker push "aroyatwork/g1n1:${BUILD_NAME}"

echo "Finished Build operations.............................."