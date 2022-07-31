#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=daoducnha29493/project-ml-microservice-kubernetes

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deploy udacity --image=$dockerpath:latest

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
pod=$(kubectl get pods --no-headers -o custom-columns=':metadata.name')
kubectl port-forward pod/$pod 8000:80