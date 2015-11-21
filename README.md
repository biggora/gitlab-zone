## Introduction
This is a Dockerfiles to build a container images for gitlab-runner. 
The container includes nodejs, npm.
Based on Ubuntu 14.04

## Git reposiory
The source files for this project can be found here: [Docker Images on Git](https://github.com/biggora/gitlab-zone)

If you have any improvements please submit a pull request.

## Docker hub repository
The Docker hub build can be found here: [Docker Images on HUB](https://hub.docker.com/r/biggora/gitlab-zone/)


## Installation
Pull the image from the docker index rather than downloading the git repo. 
This prevents you having to build the image on every docker host.

```
  docker pull biggora/gitlab-zone
```