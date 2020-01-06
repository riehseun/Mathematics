#!/bin/bash
# sed -i.bak 's/\r$//' k8s.sh
kubectl create -f jenkins-deployment.yaml
kubectl create -f jenkins-service.yaml
kubectl describe pods
kubectl cluster-info
kubectl get service
kubectl create clusterrolebinding permissive-binding --clusterrole=cluster-admin --user=admin --user=kubelet --group=system:serviceaccounts:default
kubectl -n kube-system get deployment coredns -o yaml | sed 's/allowPrivilegeEscalation: false/allowPrivilegeEscalation: true/g' | kubectl apply -f -

# cd ../jenkins
# curl -s -XPOST 'http://?:30000/createItem?name=seed-job' --data-binary @seed-job.xml -H "Content-Type:text/xml"
