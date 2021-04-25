echo "Starting cleaning operations.............................."

echo "Cleaning up docker password store..."
rm /root/.docker/config.json

echo "Cleaning previous local docker images..."
docker images | grep "g1n1" | awk '{print $1 ":" $2}' | xargs docker rmi

echo "Cleaning previous exports..."
rm ~/g1n1_tmp

echo "Stopping running docker image..."
docker stop g1n1

sleep 5

echo "Removing old docker container..."
docker container rm g1n1

echo "Finished cleaning operations.............................."