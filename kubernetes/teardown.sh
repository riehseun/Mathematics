#!/bin/bash

LB=$(gcloud compute url-maps list | awk '{print $1}' | tail -n 1)
echo $LB

BS=$(gcloud compute backend-services list | awk '{print $1}' | tail -n 2)
echo $BS

for i in $BS
	echo $i
end

# gcloud compute backend-services delete $BS



#gcloud -q compute addresses delete jenkins-master --global

#kubectl delete ingress jenkins-ingress

#gcloud -q container clusters delete k8s