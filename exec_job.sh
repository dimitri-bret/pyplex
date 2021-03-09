#!/bin/bash

# The instance name to run on 
INSTANCE="esmo-pow-1"

# The ESMO folder on your pc
MODEL_SOURCE="/mnt/c/Projects/ESMO"
#The python job executed, located in MODEL_SOURCE directory
JOB_NAME="runscenario_cired.py"
#The model name
EXPERIENCE_NAME="CIRED"

EXPERIENCE_IDENTIFIER="text_experience"



gcloud compute scp --recurse $MODEL_SOURCE $INSTANCE:~/ESMO
gcloud compute ssh $INSTANCE --command="chmod -R 777 ~/ESMO"

 ## -t -i
IMAGE_NAME="eu.gcr.io/esmo-298221/pyplex:1.0"
START_DATE=$(date '+%Y-%m-%d %H:%M:%S')

gcloud compute ssh $INSTANCE --command="docker run --name mimie_jolie -e JOB_NAME=$JOB_NAME -e EXPERIENCE_NAME=$EXPERIENCE_NAME -v ~/ESMO:/home/cplex $IMAGE_NAME ; docker cp mimie_jolie:/home/cplex ~; docker container rm mimie_jolie"
gcloud compute ssh $INSTANCE --command="gsutil cp -r ~/CPLEX_FINISHED/cplex gs://esmo-results"


#$EXPERIENCE_NAME-$EXPERIENCE_IDENTIFIER-$START_DATE