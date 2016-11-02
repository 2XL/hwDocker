###############################################
# Dockerfile to build a sample web application
###############################################
# Base image is node.js
FROM node:latest
# Author: Mr. Chenglong
MAINTAINER Mr. Chenglong <chenglong.zq@gmail.com>
# Install redis driver for node.js
RUN npm install redis
# Copy the source code to the Docker image
#  Docker host relative file path => mirror to Docker image absolute path
ADD example.js /myapp/example.js
