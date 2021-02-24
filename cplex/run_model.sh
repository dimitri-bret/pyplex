#!/bin/bash

JOB_NAME=$1
EXPERIENCE_NAME=$2
CPLEX_PATH=$3

# export PATH="$CPLEX_PATH:$PATH"

export PATH="/opt/CPLEX/cplex/bin/x86-64_linux:$PATH" ## TODO 

echo "running job $JOB_NAME"

python $JOB_NAME $EXPERIENCE_NAME
