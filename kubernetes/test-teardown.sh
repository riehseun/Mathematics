#!/bin/bash
kubectl delete ingress basic-ingress

#gcloud -q compute addresses delete web-static-ip --global

gcloud -q container clusters delete k8s