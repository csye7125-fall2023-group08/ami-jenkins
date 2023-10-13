FROM jenkins/jenkins:latest
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc.yaml
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt
#COPY github-key /var/jenkins_home/github-key
COPY casc.yaml /var/jenkins_home/casc.yaml
COPY webapp.groovy /usr/local/webapp.groovy
COPY webapp-db.groovy /usr/local/webapp-db.groovy
