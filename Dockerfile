############################################################
# Dockerfile to build container for Tests
# Based on Alpine 3.4
# include GIT NODEJS OPENSSH
############################################################

# Set the base image to Ubuntu
FROM node:4-alpine

# File Author / Maintainer
MAINTAINER Alexey Gordeyev <aleksej@gordejev.lv>

ENV NODE_SASS_PLATFORM alpine
ENV LIBSASS_VERSION=3.4.3 
ENV SASSC_VERSION=3.4.3

# Update the repository sources list
RUN apk update && apk upgrade && \
    apk add --no-cache openssh make g++ build-base libstdc++ \
    bash git curl wget zip python imagemagick && \
    rm -rf /var/cache/apk/*

RUN git clone https://github.com/sass/sassc && \
    cd sassc && \
    git clone https://github.com/sass/libsass && \
    SASS_LIBSASS_PATH=/sassc/libsass make && \
    mv bin/sassc /usr/bin/sass

# cleanup
RUN cd / && rm -rf /sassc

################## BEGIN NPM INSTALLATION ######################

RUN npm install -g node-gyp nodeunit bower gulp jshint@2.8.0 mocha istanbul should \
    chai phantomjs browserify karma karma-cli karma-jasmine karma-chrome-launcher apidoc \
    makedoc async supertest coveralls benchmark gulp grunt-cli node-sass

##################### INSTALLATION END #####################

# Expose the default port
EXPOSE 3000 22

CMD ["/bin/bash"]

WORKDIR /opt/
