#!/bin/bash
gcloud container clusters create k8s

# Reverve static IP for "jenkins-master" application
#gcloud compute addresses create web-static-ip --global

kubectl apply -f test-deployment.yaml
kubectl apply -f test-service.yaml
kubectl apply -f test-ingress.yaml

# find IP address of the application
kubectl get ingress

# Wait about 10 mins until application comes up