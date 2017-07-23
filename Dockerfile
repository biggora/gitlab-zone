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

# yarn
RUN cp /usr/local/bin/yarn /bin \
    chmod 0777 /bin/yarn

################## BEGIN NPM INSTALLATION ######################

RUN yarn install -g node-gyp bower gulp grunt-cli node-sass

##################### INSTALLATION END #####################

# create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# volumes
VOLUME ["/usr/src/app"]

# Expose the default port
EXPOSE 3000 22

CMD ["/bin/bash"]
