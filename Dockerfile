############################################################
# Dockerfile to build container for Tests
# Based on Alpine 3.4
# include GIT NODEJS OPENSSH
############################################################

# Set the base image to Ubuntu
FROM node:4-alpine

# File Author / Maintainer
MAINTAINER Alexey Gordeyev <aleksej@gordejev.lv>

# Update the repository sources list
RUN apk update && apk upgrade && \
    apk add --no-cache openssh make g++ bash git curl wget python imagemagick && \
    rm -rf /var/cache/apk/*

################## BEGIN NPM INSTALLATION ######################

RUN npm install -g node-gyp nodeunit bower gulp jshint@2.8.0 mocha istanbul should \
    chai phantomjs browserify karma karma-cli karma-jasmine karma-chrome-launcher apidoc \
    makedoc async supertest coveralls benchmark gulp grunt-cli

##################### INSTALLATION END #####################

# Expose the default port
EXPOSE 3000 22

CMD ["/bin/bash"]

WORKDIR /opt/
