# Latest version of centos
FROM centos:centos6
MAINTAINER Ernestas Poskus <hierco@gmail.com>
RUN yum clean all && \
    yum -y install epel-release && \
    yum -y update && \
    yum -y install iproute deltarpm ansible sudo

# Disable requiretty
RUN sed -i -e 's/^\(Defaults\s*requiretty\)/#--- \1/'  /etc/sudoers

# Install/prepare Ansible
RUN mkdir -p /etc/ansible/
RUN mkdir -p /opt/ansible/roles
RUN echo "[local]\nlocalhost ansible_connection=local" > /etc/ansible/hosts
RUN echo "[defaults]\nroles_path = /opt/ansible/roles" > /etc/ansible/hosts
