#############################################
# Dockerfile to build the unittest container
#############################################

# Base image is python
FROM python:latest
# Author: Mr. Chenglong
MAINTAINER Mr. Chenglong <chenglong.zq@gmail.com>
# Install redis driver for python and the redis mock
RUN pip install redis && pip install mockredispy && pip install mock
# Copy the test and source to the Docker image
ADD src/ /src/
# Change the working directory to /src/
WORKDIR /src/
# Make unittest as the default execution
ENTRYPOINT python -m unittest
# ENTRYPOINT, command that is executed during the launch of the container
