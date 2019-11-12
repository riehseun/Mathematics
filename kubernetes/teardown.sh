#!/bin/bash

# Remove ingress
kubectl delete ingress jenkins-ingress

# Remove proxy
UM=$(gcloud compute url-maps list | awk '{print $1}' | tail -n 1)
TP=$(sed "s/um/tp/g" <<< "$UM")
echo "target proxies"
echo $TP
gcloud -q compute target-https-proxies delete $TP

# Remove url maps
echo "url map"
echo $UM
gcloud -q compute url-maps delete $UM

# Remove forwarding rules
FR=$(gcloud compute forwarding-rules list | awk '{print $1}' | tail -n 1)
echo "forwarding rules"
echo $FR
gcloud -q compute backend-services delete $FR --global

# Remove all backend services
BS=$(gcloud compute backend-services list | awk '{print $1}' | tail -n 1)
echo "backend services"
for i in $BS; do
	echo $i
	gcloud -q compute backend-services delete $i --global
done

# Remove health checks
HC=$(gcloud compute health-checks list | awk '{print $1}' | tail -n 1)
echo "health checks"
for i in $HC; do
	echo $i
	gcloud -q compute health-checks delete $HC
done

# Remove static IP
gcloud -q compute addresses delete jenkins-master --global

# Remove cluster
gcloud -q container clusters delete k8s