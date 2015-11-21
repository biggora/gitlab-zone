############################################################
# Dockerfile to build container for Tests
# Based on Ubuntu 14.04
# include GIT NODEJS
############################################################

# Set the base image to Ubuntu
FROM ubuntu:14.04

# File Author / Maintainer
MAINTAINER Alexey Gordeyev <aleksej@gordejev.lv>

# Update the repository sources list
RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get autoclean -y

################## BEGIN INSTALLATION ######################

RUN apt-get install -y ca-certificates build-essential git nodejs-legacy nodejs-dev npm \
    imagemagick graphicsmagick  ntp nano && \
    update-ca-certificates -f && \
    npm install -g npm nodeunit bower gulp jshint mocha istanbul should chai

ENV LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 TERM=xterm
RUN locale-gen $LC_ALL

##################### INSTALLATION END #####################


# Expose the default port
EXPOSE 3000

WORKDIR /usr/local/
