#!/bin/bash

# The instance name to run on 
INSTANCE="esmo-1"

# The ESMO folder on your pc
MODEL_SOURCE="/mnt/c/Projects/ESMO"
#The python job executed, located in MODEL_SOURCE directory
JOB_NAME="runscenario_cired.py"
#The model name
EXPERIENCE_NAME="CIRED"

chmod -R +r $MODEL_SOURCE
# gcloud compute scp --recurse $MODEL_SOURCE $INSTANCE:~/ESMO
gcloud compute ssh $INSTANCE --command="chmod -R 777 ~/ESMO"


# gcloud compute ssh $INSTANCE --command= \
#     "docker run -t -i --rm \
#     -e JOB_NAME=$JOB_NAME \
#     -e EXPERIENCE_NAME=$EXPERIENCE_NAME \
#     -v $MODEL_SOURCE:/home/ESMO pyplex:1.0"