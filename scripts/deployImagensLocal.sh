#!/bin/bash

eval $(minikube docker-env)

docker build -t clinica-db ../src/main/java/br/ufscar/dc/dsw/dao/
docker build -t clinica-redis ../redis
docker build -t clinica-app ../src/main/java/br/ufscar/dc/dsw/

