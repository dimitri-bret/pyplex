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

chmod -R +r $MODEL_SOURCE
gcloud compute scp --recurse $MODEL_SOURCE $INSTANCE:~/ESMO
gcloud compute ssh $INSTANCE --command="chmod -R 777 ~/ESMO"
gcloud compute ssh $INSTANCE --command="sudo usermod -a -G docker \${USER}"
gcloud compute ssh $INSTANCE --command="docker-credential-gcr configure-docker"


gcloud compute ssh $INSTANCE --command= \
#     "docker run -t -i --rm \
#     -n MIMIE_JOLIE  
#     -e JOB_NAME=$JOB_NAME \
#     -e EXPERIENCE_NAME=$EXPERIENCE_NAME \
#     -v $MODEL_SOURCE:/home/cplex pyplex:1.0"



gcloud compute ssh $INSTANCE --command=\
"docker cp blissful_wiles:/home/cplex ~/cplex_finished_experience_identifier"