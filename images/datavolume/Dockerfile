#######################################################
# Dockerfile to build a LOG Volume for Apache2 Service
#######################################################
# Base image is BusyBox
FROM busybox:latest
# Author: Mr. Cheng
MAINTAINER Mr. Cheng <chenglong.zq@gmail.com>
# Create a data volume at /var/log/apache2, which is
# same as the log directory PATH set for the apache image
VOLUME /var/log/apache2
# Execute command true
CMD ["/bin/true"]
