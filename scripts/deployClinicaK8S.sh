#!/bin/bash

minikube delete
minikube start
minikube addons enable ingress
sleep 10
kubectl apply -f ../k8s/db/secret.yaml
kubectl apply -f ../k8s/app/configmap.yaml
kubectl apply -f ../k8s/db/pv.yaml
kubectl apply -f ../k8s/db/pvc.yaml
kubectl apply -f ../k8s/db/deployment.yaml
sleep 10
kubectl apply -f ../k8s/db/service.yaml
sleep 10
kubectl apply -f ../k8s/redis/deployment.yaml
sleep 10
kubectl apply -f ../k8s/redis/service.yaml
sleep 10
kubectl apply -f ../k8s/app/deployment.yaml
sleep 10
kubectl apply -f ../k8s/app/service.yaml
sleep 10
kubectl apply -f ../k8s/ingress.yaml
sleep 10
