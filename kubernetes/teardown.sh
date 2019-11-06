#!/bin/bash

# Remove all backend services
BS=$(gcloud compute backend-services list | awk '{print $1}' | tail -n 2)
for i in $BS; do
	gcloud -q compute backend-services delete $i
done

# Remove forwarding rules
FR=$(gcloud compute forwarding-rules list | awk '{print $1}' | tail -n 1)
gcloud -q compute backend-services delete $FR

# Remove static IP
gcloud -q compute addresses delete jenkins-master --global

# Remove health checks
HC=$(gcloud compute health-checks list | awk '{print $1}' | tail -n 2)
for i in $HC; do
	gcloud -q compute health-checks delete $HC
done

# Remove url maps
UM=$(gcloud compute url-maps list | awk '{print $1}' | tail -n 1)
gcloud compute url-maps delete $UM

# Remove ingress
kubectl delete ingress jenkins-ingress

# Remove cluster
gcloud -q container clusters delete k8s