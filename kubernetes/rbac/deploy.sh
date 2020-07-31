#!/bin/bash

# Traverse the files and execute 

for filename in *.yaml; do
    kubectl create -f $filename
done
