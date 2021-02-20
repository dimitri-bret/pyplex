#!/bin/bash

PROJECT_ID="esmo-298221"
ZONE="europe-west1-b"
INSTANCE="esmo-1"
MODEL_SOURCE="/c/Projects/ESMO"


gcloud compute scp --recurse $MODEL_SOURCE $INSTANCE:~model
gcloud compute scp --recurse $MODEL_SOURCE $INSTANCE:~model

