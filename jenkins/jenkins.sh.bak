#!/bin/bash

POD=$(kubectl get pods | awk '{print $1}' | tail -n 1)

# Copy local files into directories inside container
kubectl cp config.xml $POD:/var/jenkins_home/config.xml
kubectl cp org.jenkinsci.plugins.workflow.libs.GlobalLibraries.xml $POD:/var/jenkins_home/org.jenkinsci.plugins.workflow.libs.GlobalLibraries.xml
kubectl cp org.jenkinsci.plugins.configfiles.GlobalConfigFiles.xml $POD:/var/jenkins_home/org.jenkinsci.plugins.configfiles.GlobalConfigFiles.xml

IP=$(kubectl get ingress | awk '{print $3}' | tail -n 1)

# Restart Jenkins
wget http://$IP/jnlpJars/jenkins-cli.jar
java -jar jenkins-cli.jar -s http://$IP/restart
rm -f jenkins-cli.jar

#kubectl exec -it $POD -- /bin/bash