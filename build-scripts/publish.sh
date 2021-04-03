#!/bin/bash

set -e

echo "Starting Publish operations.............................."

WORkSPACE="/root/gen_node_workspace/workspace/g1n1"
VERSION=$(date +%s)
ARTIFACT_NAME="g1n1_archive.${VERSION}.zip"
DEPLOYMENT_SERVER="139.59.25.64"

echo "Moving inside build workspace..."
cd  $WORkSPACE
pwd

echo "Archiving the build artifact..."
zip -r ${ARTIFACT_NAME} basic-flexbox/

echo "Copying generated artifact to staging folder..."
cp ${ARTIFACT_NAME} /root/artifacts/

echo "Moving the staged artifact to deployment server ${DEPLOYMENT_SERVER}..."
sshpass -p "96MZjebtMW4-g8C" scp -pC /root/artifacts/${ARTIFACT_NAME} root@${DEPLOYMENT_SERVER}:/root/artifacts/

echo "Finished Publish operations.............................."