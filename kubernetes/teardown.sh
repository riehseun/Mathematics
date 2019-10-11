#!/bin/bash
kubectl delete ingress jenkins-ingress

# gcloud -q compute addresses delete jenkins-master --global

gcloud -q container clusters delete k8s