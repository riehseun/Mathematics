#!/bin/bash

# Remove all backend services
BS=$(gcloud compute backend-services list | awk '{print $1}' | tail -n 2)
for i in $BS; do
	echo $i
	#gcloud -q compute backend-services delete $i
done

# Remove forwarding rules
FR=$(gcloud compute forwarding-rules list | awk '{print $1}' | tail -n 1)
echo $FR
#gcloud -q compute backend-services delete $FR

# Remove static IP
#gcloud -q compute addresses delete jenkins-master --global

# Remove health checks
HC=$(gcloud compute health-checks list | awk '{print $1}' | tail -n 2)
echo $HC
#gcloud -q compute health-checks delete $HC

# Remove url maps
UM=$(gcloud compute url-maps list | awk '{print $1}' | tail -n 1)
echo $UM
#gcloud compute url-maps delete $UM

#kubectl delete ingress jenkins-ingress

#gcloud -q container clusters delete k8s