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
RUN apt-get update -q && \
    apt-get dist-upgrade -y -q && \
    apt-get autoclean -y

################## BEGIN INSTALLATION ######################

RUN apt-get install -y -q ca-certificates build-essential git python python-software-properties \
    python-yaml curl wget imagemagick graphicsmagick ntp nano bash-completion sudo phantomjs && \
    update-ca-certificates -f
RUN curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
RUN apt-get update -q && \
    apt-get install -y nodejs && \
    apt-get autoclean -y
RUN npm install -g --save-dev node-gyp nodeunit bower gulp jshint mocha istanbul should \
    chai phantomjs browserify apidoc makedoc supertest coveralls benchmark grunt-cli

ENV LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 TERM=xterm
RUN locale-gen $LC_ALL

##################### INSTALLATION END #####################

# Expose the default port
EXPOSE 3000

CMD ["/bin/bash"]

WORKDIR /opt/
