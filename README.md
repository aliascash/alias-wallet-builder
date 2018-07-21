# spectre-builder-part1
### 1st part of builder image for spectrecoind compilation

This repository contains a Dockerfile to create a builder image which could be used
to compile spectrecoind etc. So with each build of spectrecoind it is not 
necessary to setup the required build environment again and again.

## Facts
* Image is based on Debian Stretch
* Installs all required default dependencies
