#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath=coil/predictive_model

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"

cat ./my_password.txt | docker login --username coil --password-stdin

docker tag predictive_model ${dockerpath}:latest
docker commit predictive_model ${dockerpath}:latest

# Step 3:
# Push image to a docker repository
docker push ${dockerpath}:latest
