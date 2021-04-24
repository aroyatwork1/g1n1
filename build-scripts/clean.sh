echo "Starting cleaning operations.............................."

echo "Cleaning up docker password store..."
rm /root/.docker/config.json

echo "Cleaning stale local docker images..."
docker images | grep "g1n1" | awk '{print $1 ":" $2}' | xargs docker rmi

echo "Cleaning previous exports..."
unset G1N1_IMAGE_NAME

echo "Finished cleaning operations.............................."