# spectre-builder-part1
### 1st part of builder image for spectrecoind compilation

This repository contains a Dockerfile to create the 1st part of a builder 
image which could be used to compile spectrecoind etc. So with each build 
of spectrecoind it is not necessary to setup the required build environment 
again and again.

The build images are split into multiple parts as there are some limitations
on DockerHub like
* 2 hours
* 2 GB RAM
* 1 CPU
* 30 GB Disk Space

## Facts
* Image is based on Debian Stretch
* Installs all required default dependencies

## How it is build
```
docker build -t hlxeasy/spectre-builder-part1:latest .
```