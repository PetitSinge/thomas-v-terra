#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: ./ws.sh <env>"
  echo "Example: ./ws.sh staging"
  exit 1
fi

ENV=$1
terraform init
terraform plan -var-file="env/${ENV}.tfvars"
terraform apply -var-file="env/${ENV}.tfvars" -auto-approve
