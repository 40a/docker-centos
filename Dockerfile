FROM centos:7

RUN yum -y install epel-release \
    && yum clean all

RUN yum -y install supervisor \
    && yum clean all

COPY supervisord.conf /etc/supervisord.conf
