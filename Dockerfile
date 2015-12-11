FROM centos:7

RUN yum -y install epel-release && \
    yum -y install ansible git sudo supervisor && \
    yum clean all

COPY supervisord.conf /etc/supervisord.conf

# Disable requiretty in /etc/sudoers, found at https://gist.github.com/petems/367f8119bbff011bf83e
# If we don't do this, Ansible is unable to use sudo within the localhost context
RUN echo "Removing requiretty" && \
    sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

# Configure Ansible to run locally by default
RUN echo '[local]' > /etc/ansible/hosts && \
    echo 'localhost' >> /etc/ansible/hosts && \
    echo '[defaults]' > .ansible.cfg && \
    echo 'transport = local' >> .ansible.cfg
