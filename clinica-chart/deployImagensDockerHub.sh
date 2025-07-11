#!/bin/bash

docker build -t giovannavictoriarossetto/clinica-db:latest ./src/main/java/br/ufscar/dc/dsw/dao/
docker build -t giovannavictoriarossetto/clinica-redis:latest ./redis
docker build -t giovannavictoriarossetto/clinica-app:latest ./src/main/java/br/ufscar/dc/dsw/

docker push giovannavictoriarossetto/clinica-db:latest
docker push giovannavictoriarossetto/clinica-redis:latest
docker push giovannavictoriarossetto/clinica-app:latest
