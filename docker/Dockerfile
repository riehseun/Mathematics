FROM jenkins/jenkins:lts

ARG user=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000
ARG http_port=8080
ARG agent_port=50000
ARG JENKINS_HOME=/var/jenkins_home

ENV JENKINS_HOME $JENKINS_HOME
ENV JENKINS_SLAVE_AGENT_PORT ${agent_port}

USER root

RUN mkdir -p $JENKINS_HOME
RUN chown -R ${user}:${group} $JENKINS_HOME
RUN chmod -R 755 $JENKINS_HOME

VOLUME $JENKINS_HOME

# for main web interface:
EXPOSE ${http_port}

# will be used by attached slave agents:
EXPOSE ${agent_port}

# USER ${user}

# add the admin user
# COPY /configs/users "$JENKINS_HOME"/users/

# Add the main config file to the jenkins path
# COPY /configs/jenkins_home_config.xml "$JENKINS_HOME"/config.xml

# Name the jobs
# ARG job_name_1="seed-job"

# Create the job workspaces
# RUN mkdir -p "$JENKINS_HOME"/workspace/${job_name_1}

# Create the jobs folder recursively
# RUN mkdir -p "$JENKINS_HOME"/jobs/${job_name_1}

# Add the custom configs to the container
# COPY /configs/${job_name_1}_config.xml "$JENKINS_HOME"/jobs/${job_name_1}/config.xml

# Create build file structure
# USER root
# RUN mkdir -p "$JENKINS_HOME"/jobs/${job_name_1}/latest/
# RUN mkdir -p "$JENKINS_HOME"/jobs/${job_name_1}/builds/1/
# RUN chown -R ${user}:${group} "$JENKINS_HOME"/jobs/${job_name_1}
# USER ${user}

# Set number of executors in Jenkins master
COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy

# install plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt