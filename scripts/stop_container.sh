#!/bin/bash
set -e

# Stop and remove the running container (if any)
CONTAINER_ID=$(docker ps -q --filter "name=simple-python-flask-app")

if [ -n "$CONTAINER_ID" ]; then
  echo "Stopping and removing container with ID: $CONTAINER_ID"
  docker rm -f "$CONTAINER_ID"
else
  echo "No running container found with the specified name."
fi
