# spectre-builder
### Builder image for spectrecoin/spectrecoind compilation

This repository contains a Dockerfile to create a builder image which could 
be used to compile spectrecoind etc. So with each build of spectrecoind it 
is not necessary to setup the required build environment again and again.

## Facts
* Image is based on Debian Stretch
* Installs all required default dependencies

## How it is build
```
docker build -t spectreproject/spectre-builder:latest .
```
