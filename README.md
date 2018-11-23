# Spectrecoin builder image

Build status: [![Build Status](https://ci.spectreproject.io/buildStatus/icon?job=Spectrecoin/spectre-builder/develop&build=10)](https://ci.spectreproject.io/job/Spectrecoin/job/spectre-builder/job/develop/)

|              |   |   |    |
|:--           |:--|:--|:---|
| Debian       | [![Docker Stars](https://img.shields.io/docker/stars/spectreproject/spectre-builder-debian.svg)](https://hub.docker.com/r/spectreproject/spectre-builder-debian/) | [![Docker Pulls](https://img.shields.io/docker/pulls/spectreproject/spectre-builder-debian.svg)](https://hub.docker.com/r/spectreproject/spectre-builder-debian/) | [![ImageLayers](https://images.microbadger.com/badges/image/spectreproject/spectre-builder-debian.svg)](https://microbadger.com/#/images/spectreproject/spectre-builder-debian) |
| Fedora       | [![Docker Stars](https://img.shields.io/docker/stars/spectreproject/spectre-builder-fedora.svg)](https://hub.docker.com/r/spectreproject/spectre-builder-fedora/) | [![Docker Pulls](https://img.shields.io/docker/pulls/spectreproject/spectre-builder-fedora.svg)](https://hub.docker.com/r/spectreproject/spectre-builder-fedora/) | [![ImageLayers](https://images.microbadger.com/badges/image/spectreproject/spectre-builder-fedora.svg)](https://microbadger.com/#/images/spectreproject/spectre-builder-fedora) |
| Raspberry Pi | [![Docker Stars](https://img.shields.io/docker/stars/spectreproject/spectre-builder-raspi.svg)](https://hub.docker.com/r/spectreproject/spectre-builder-raspi/) | [![Docker Pulls](https://img.shields.io/docker/pulls/spectreproject/spectre-builder-raspi.svg)](https://hub.docker.com/r/spectreproject/spectre-builder-raspi/) | [![ImageLayers](https://images.microbadger.com/badges/image/spectreproject/spectre-builder-raspi.svg)](https://microbadger.com/#/images/spectreproject/spectre-builder-raspi)   |
| Ubuntu       | [![Docker Stars](https://img.shields.io/docker/stars/spectreproject/spectre-builder-ubuntu.svg)](https://hub.docker.com/r/spectreproject/spectre-builder-ubuntu/) | [![Docker Pulls](https://img.shields.io/docker/pulls/spectreproject/spectre-builder-ubuntu.svg)](https://hub.docker.com/r/spectreproject/spectre-builder-ubuntu/) | [![ImageLayers](https://images.microbadger.com/badges/image/spectreproject/spectre-builder-ubuntu.svg)](https://microbadger.com/#/images/spectreproject/spectre-builder-ubuntu) |

## Builder images for spectrecoin/spectrecoind compilation

This repository contains Dockerfiles to create builder images which could
be used to compile [spectrecoind](https://github.com/spectrecoin/spectre)
for various distributions. So with each build of spectrecoind it is not
necessary to setup the required build environment again and again.

## Facts
* Dockerfiles for the following distributions
  * CentOS
  * Debian
  * Fedora
  * Raspberry Pi
  * Ubuntu
* Installs all required default dependencies

## How it is build
```
docker build -t spectreproject/spectre-builder:latest .
```
