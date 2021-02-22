#!/bin/bash
# MODEL_SOURCE="/c/Projects/ESMO"
MODEL_SOURCE="/mnt/c/Projects/docker-cplex/model"
# JOB_NAME="runscenario_cired.py"
JOB_NAME="model.py"

EXPERIENCE_NAME="CIRED"

docker run -t -i --rm \
-e JOB_NAME=$JOB_NAME \
-e EXPERIENCE_NAME=$EXPERIENCE_NAME \
-v $MODEL_SOURCE:/home/cplex pyplex:1.0
