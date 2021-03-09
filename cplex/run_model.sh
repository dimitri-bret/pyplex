#!/bin/bash
JOB_NAME=$1
EXPERIENCE_NAME=$2

export PATH="/opt/CPLEX/cplex/bin/x86-64_linux:$PATH"

echo "running job $JOB_NAME"

python $JOB_NAME $EXPERIENCE_NAME