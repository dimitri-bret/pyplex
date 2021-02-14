#!/bin/bash
MODEL_SOURCE="/c/Projects/ESMO"
JOB_NAME="runscenario_cired.py"
EXPERIENCE_NAME="CIRED"

docker run -t -i --rm \
-e JOB_NAME=$JOB_NAME \
-e EXPERIENCE_NAME=$EXPERIENCE_NAME \
-v $MODEL_SOURCE:/home/model pyplex
