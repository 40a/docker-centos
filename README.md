# About

This base CentOS Docker image is used by the majority of applications provisioned for IDI partners. Currently it uses the [official CentOS 7 image](https://registry.hub.docker.com/_/centos/). Notable attributes include:

* CentOS minor version tags
* EPEL repository is enabled
* Supervisor is installed

# How to use

Ideally you should base your image off this one and add any application [Supervisor configuration](http://supervisord.org/configuration.html) files in the `/etc/supervisord.d/` directory.
