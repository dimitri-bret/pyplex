#!/bin/bash

# The instance name to run on 
INSTANCE="esmo-pow-1"

# The ESMO folder on your pc
MODEL_SOURCE="/mnt/c/Projects/ESMO"
#The python job executed, located in MODEL_SOURCE directory
JOB_NAME="runscenario_cired.py"
#The model name
EXPERIENCE_NAME="CIRED"

gcloud compute scp --recurse $MODEL_SOURCE $INSTANCE:~/ESMO

START_DATE=$(date '+%Y-%m-%d-%H:%M:%S')
EXPERIENCE_IDENTIFIER=$EXPERIENCE_NAME-$START_DATE


gcloud compute scp  ./run_job.sh $INSTANCE:~
gcloud compute ssh $INSTANCE --command="./run_job.sh $JOB_NAME $EXPERIENCE_NAME $EXPERIENCE_IDENTIFIER" #>/dev/null 2>&1"
