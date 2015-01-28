FROM centos:7

RUN yum -y install epel-release glibc-2.17-55.el7_0.5 \
    && yum clean all

RUN yum -y install supervisor \
    && yum clean all

COPY supervisord.conf /etc/supervisord.conf
