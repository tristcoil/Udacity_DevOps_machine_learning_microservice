#!/usr/bin/env bash

# Step 1:
# This is your Docker ID/path
dockerpath="coil/predictive_model"

# Step 2
# Run the Docker Hub container with kubernetes
# do not use underscores for names in kubernetes, commands will fail
#kubectl create deployment predictive-deployment --image=${dockerpath}
kubectl run predictive-model --generator=run-pod/v1 --image=${dockerpath} --port=80 --labels app=predictive-model

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
# make_prediction.sh uses port 8000 on localhost
# starting pod takes time
#kubectl expose deployment/predictive-deployment --type="NodePort" --port 8000
echo "sleeping"
sleep 120
kubectl port-forward predictive-model 8000:80
