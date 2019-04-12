#!/bin/bash
kubectl create -f jenkins-deployment.yaml
kubectl create -f jenkins-service.yaml
kubectl describe pods
kubectl cluster-info
kubectl get service
kubectl create clusterrolebinding permissive-binding --clusterrole=cluster-admin --user=admin --user=kubelet --group=system:serviceaccounts:default

