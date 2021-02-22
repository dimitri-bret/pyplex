#!/bin/bash


# PROJECT SETTINGS, DO NOT MODIFY
PROJECT_ID="esmo-298221"
ZONE="europe-west1-b"
INSTANCE="esmo-1"


# YOUR MODEL SOURCE
MODEL_SOURCE="/c/Projects/ESMO"
#The python job executed
JOB_NAME="runscenario_cired.py"
#The model name
EXPERIENCE_NAME="CIRED"


gcloud compute scp --recurse $MODEL_SOURCE $INSTANCE:~/cplex

gcloud compute ssh $INSTANCE --command= \
    "docker run -t -i --rm \
    -e JOB_NAME=$JOB_NAME \
    -e EXPERIENCE_NAME=$EXPERIENCE_NAME \
    -v $MODEL_SOURCE:/home/cplex pyplex:1.0"