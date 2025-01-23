#!/bin/bash

#terraform workspace select ${ENV}

terraform plan -var-file=env/${ENV}.tfvars -state=states/${ENV}/terraform.tfstate

terraform apply env/${ENV}.tfvars -state=states/${ENV}/terraform.tfstate
