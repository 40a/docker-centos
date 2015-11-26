FROM centos:7

RUN yum -y install epel-release \
    && yum clean all

RUN yum -y install supervisor \
    && yum clean all

COPY supervisord.conf /etc/supervisord.conf

RUN yum install sudo -y \
    && yum clean all

# Disable requiretty in /etc/sudoers, found at https://gist.github.com/petems/367f8119bbff011bf83e
# If we don't do this, Ansible is unable to use sudo within the localhost context
RUN echo "Removing requiretty" \
    && sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers \
    && echo "Complete!"

RUN yum -y install git -y \
    && yum clean all

RUN yum -y install ansible -y \
    && yum clean all
