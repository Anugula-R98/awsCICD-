#!/bin/bash
set -e

# Define variables for image name and tag
IMAGE_NAME="anugula27/simple-python-flask-app"
TAG="latest"
CONTAINER_NAME="simple-python-flask-app"

# Pull the Docker image
echo "Pulling the Docker image: $IMAGE_NAME:$TAG"
docker pull "$IMAGE_NAME:$TAG"

# Check if a container with the same name is already running and stop it
if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
  echo "Stopping and removing existing container: $CONTAINER_NAME"
  docker stop "$CONTAINER_NAME"
  docker rm "$CONTAINER_NAME"
fi

# Run the Docker image as a container
echo "Starting a new container: $CONTAINER_NAME"
docker run -d --name "$CONTAINER_NAME" -p 5000:5000 "$IMAGE_NAME:$TAG"

echo "Container started successfully!"
