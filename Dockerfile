FROM jenkins/jenkins:lts

# Skip the setup wizard
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false --illegal-access=deny

# Set the CasC config path
ENV CASC_JENKINS_CONFIG /var/jenkins_home/my_marvin.yml

# Install plugins
COPY --chown=jenkins:jenkins plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt

# Add config file
COPY my_marvin.yml /var/jenkins_home/my_marvin.yml

# Add job
COPY ./job_dsl.groovy ./job_dsl.groovy