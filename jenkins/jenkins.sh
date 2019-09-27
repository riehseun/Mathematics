#!/bin/bash

 POD=$(kubectl get pods | awk '{print $1}' | head -n 2)
 kubectl cp config.xml $POD:/var/jenkins_home/config.xml
 kubectl cp org.jenkinsci.plugins.workflow.libs.GlobalLibraries.xml $POD:/var/jenkins_home/org.jenkinsci.plugins.workflow.libs.GlobalLibraries.xml
 #kubectl exec -it $POD -- /bin/bash