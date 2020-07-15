#!/bin/bash

# Find namespaces 

for filename in ../namespace/*.yaml; do 
    
    NAMESPACE=`echo $filename | cut -d "/" -f3 | cut -d "." -f1`

    # Create Docker Login Secret 
    # Values of DOCKERHUB_USERNAME, DOCKERHUB_PASSWORD, DOCKERHUB_EMAIL_ID are stored as env variables in .bash_profile or .bashrc

    kubectl -n $NAMESPACE create secret docker-registry dockerlogin \
        --docker-server=https://index.docker.io/v1/ \
        --docker-username=$DOCKERHUB_USERNAME \
        --docker-password=$DOCKERHUB_PASSWORD \
        --docker-email=$DOCKERHUB_EMAIL_ID

done
