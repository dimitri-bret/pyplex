#!/bin/bash
curl -fsSL https://get.docker.com -o get-docker.sh
sudo usermod -aG docker dimitri_bret_gmail_com
gcloud auth configure-docker --quiet
docker pull eu.gcr.io/esmo-298221/pyplex:1.0

