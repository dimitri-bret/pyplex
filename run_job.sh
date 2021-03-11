#!/bin/bash

JOB_NAME=$1
EXPERIENCE_NAME=$2
EXPERIENCE_IDENTIFIER=$3

IMAGE_NAME="eu.gcr.io/esmo-298221/pyplex:1.0"
FINAL_FOLDER=~/$EXPERIENCE_IDENTIFIER

sudo chmod -R 777 ~/ESMO

docker run --name mimie_jolie\
        -e JOB_NAME=$JOB_NAME\
        -e EXPERIENCE_NAME=$EXPERIENCE_NAME\
        -v ~/ESMO:/home/cplex $IMAGE_NAME

docker cp mimie_jolie:/home/cplex ~\


mkdir $FINAL_FOLDER
sudo chmod -R 777 ~/cplex

cp -R ~/cplex/output_data $FINAL_FOLDER
cp -R ~/cplex/input_data $FINAL_FOLDER
cp -R ~/cplex/log $FINAL_FOLDER/log

gsutil -m cp -r $FINAL_FOLDER gs://esmo-results

rm -R ~/cplex
rm -R $FINAL_FOLDER
rm -R ~/ESMO
rm ~/run_job.sh
docker container rm mimie_jolie
