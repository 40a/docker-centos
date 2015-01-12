FROM centos:centos7.0.1406

RUN yum -y install epel-release \
    && yum clean all

RUN yum -y install supervisor \
    && yum clean all

COPY supervisord.conf /etc/supervisord.conf
