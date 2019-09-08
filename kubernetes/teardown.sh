#!/bin/bash
kubectl delete ingress jenkins-ingress

gcloud compute addresses delete jenkins-master --global

gcloud container clusters delete k8s