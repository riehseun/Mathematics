#!/bin/bash
# sed -i.bak 's/\r$//' k8s.sh
# kubectl create -f jenkins-deployment.yaml
# kubectl create -f jenkins-service.yaml
# kubectl describe pods
# kubectl cluster-info
# kubectl get service
# kubectl create clusterrolebinding permissive-binding --clusterrole=cluster-admin --user=admin --user=kubelet --group=system:serviceaccounts:default
# kubectl -n kube-system get deployment coredns -o yaml | sed 's/allowPrivilegeEscalation: false/allowPrivilegeEscalation: true/g' | kubectl apply -f -

# cd ../jenkins
# curl -s -XPOST 'http://?:30000/createItem?name=seed-job' --data-binary @seed-job.xml -H "Content-Type:text/xml"

# Load balancer and static IP

gcloud container clusters create k8s

# Reverve static IP for "jenkins-master" application
gcloud compute addresses create jenkins-master --global

# NGINX Ingress Controller setup
# Initialize current user as a cluster-admin
#kubectl create clusterrolebinding cluster-admin-binding --clusterrole cluster-admin --user $(gcloud config get-value account)
#kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/mandatory.yaml
#kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/cloud-generic.yaml
# Verify installation
# kubectl get pods --all-namespaces -l app.kubernetes.io/name=ingress-nginx --watch

kubectl apply -f jenkins-deployment.yaml
kubectl apply -f jenkins-service.yaml
kubectl apply -f jenkins-ingress.yaml

# find IP address of the application
#kubectl get ingress

# Wait about 10 mins until application comes up

# Also check GCP -> Network Services -> Load balancing to see if there are existing services running

# Also check GCP -> Compute Engine -> Health Checks to see if there are existing services running

# gcloud compute backend-services update k8s-be-31222--06a63a3d09be589c --timeout=60 --global

# gcloud compute backend-services list

# kubectl patch svc jenkins-svc -p '{"spec":{"externalTrafficPolicy":"Local"}}'


# kubectl -n kube-system get po