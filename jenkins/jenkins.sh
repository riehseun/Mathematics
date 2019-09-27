#!/bin/bash

 POD=$(kubectl get pods | awk '{print $1}' | head -n 2)

 # Copy local files into directories inside container
 kubectl cp config.xml $POD:/var/jenkins_home/config.xml
 kubectl cp org.jenkinsci.plugins.workflow.libs.GlobalLibraries.xml $POD:/var/jenkins_home/org.jenkinsci.plugins.workflow.libs.GlobalLibraries.xml
 IP=$(kubectl get ingress | awk '{print $3}' | tail -n 1)
 wget http://$IP/restart
 #kubectl exec -it $POD -- /bin/bash