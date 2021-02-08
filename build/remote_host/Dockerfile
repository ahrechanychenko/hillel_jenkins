FROM centos:7

RUN yum -y install openssh-server sudo epel-release  

RUN useradd remote_user && \
    echo "1234" | passwd remote_user  --stdin && \
    mkdir /home/remote_user/.ssh && \
    usermod -aG wheel remote_user && \
    echo "%wheel        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers && \
    chmod 700 /home/remote_user/.ssh

COPY remote-key.pub /home/remote_user/.ssh/authorized_keys

RUN chown remote_user:remote_user   -R /home/remote_user && \
    chmod 400 /home/remote_user/.ssh/authorized_keys

RUN ssh-keygen -A

RUN yum -y install mysql && \
    yum -y install epel-release && \
    yum -y install python3-pip && \
    pip3 install --upgrade pip && \
    pip3 install awscli 

RUN yum install -y yum-utils device-mapper-persistent-data lvm2 && \
    yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo && \
    yum install -y docker-ce && \
    usermod -aG docker remote_user && newgrp docker && \
    yum install -y python-pip python-devel gcc && \
    yum install -y python3-pip && \
    pip3 install docker-compose && \
    ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose && \
    pip install --upgrade pip && \
    yum upgrade python* 
CMD /usr/sbin/sshd -D
