FROM jenkins/jenkins
USER root
RUN apt update && apt install sudo git -y && curl https://bootstrap.pypa.io/2.7/get-pip.py --output get-pip.py && \
    python get-pip.py && \
    pip install ansible --upgrade
COPY remote-key.pub /var/jenkins_home
USER jenkins
