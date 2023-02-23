FROM ubuntu:22.04

RUN apt-get update

RUN apt-get install -y openssh-server \
                       lsb-release \
                       gpg \
                       build-essential \
                       git

RUN mkdir /var/run/sshd

RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN mkdir /root/.ssh
COPY id_rsa.pub /root/.ssh/authorized_keys

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
