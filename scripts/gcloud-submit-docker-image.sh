#!/bin/bash

file=$1

project_id=''
cloudRun_container_name=''

while read line; do

  IFS=' '

  read -a key_value <<< $line

  if [ ${key_value[0]} = 'project_id' ]; then
    project_id=$(echo "${key_value[2]}" | tr -d '"')
  fi

  if [ ${key_value[0]} = 'cloudRun_container_name' ]; then
    cloudRun_container_name=$(echo "${key_value[2]}" | tr -d '"')
  fi

done < $file

#echo "gcr.io/$project_id/$cloudRun_container_name:latest"

gcloud builds submit --tag "gcr.io/$project_id/$cloudRun_container_name:latest" .
