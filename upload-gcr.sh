#!/bin/bash

HOSTNAME="eu.gcr.io"
PROJECT_ID="esmo-298221"
IMAGE="pyplex"
TAG="1.0"



docker build -t $IMAGE:$TAG .
docker tag $IMAGE:$TAG $HOSTNAME/$PROJECT_ID/$IMAGE
gcloud auth configure-docker
docker tag $IMAGE:$TAG $HOSTNAME/$PROJECT_ID/$IMAGE:$TAG
docker push $HOSTNAME/$PROJECT_ID/$IMAGE:$TAG
