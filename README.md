# Alias builder image

Build status: [![Build Status](https://ci.alias.cash/buildStatus/icon?job=Alias/alias-builder/develop&build=10)](https://ci.alias.cash/job/Alias/job/alias-builder/job/develop/)

|              |   |   |    |
|:--           |:--|:--|:---|
| Debian       | [![Docker Stars](https://img.shields.io/docker/stars/aliascash/alias-builder-debian.svg)](https://hub.docker.com/r/aliascash/alias-builder-debian/) | [![Docker Pulls](https://img.shields.io/docker/pulls/aliascash/alias-builder-debian.svg)](https://hub.docker.com/r/aliascash/alias-builder-debian/) | [![ImageLayers](https://images.microbadger.com/badges/image/aliascash/alias-builder-debian.svg)](https://microbadger.com/#/images/aliascash/alias-builder-debian) |
| Fedora       | [![Docker Stars](https://img.shields.io/docker/stars/aliascash/alias-builder-fedora.svg)](https://hub.docker.com/r/aliascash/alias-builder-fedora/) | [![Docker Pulls](https://img.shields.io/docker/pulls/aliascash/alias-builder-fedora.svg)](https://hub.docker.com/r/aliascash/alias-builder-fedora/) | [![ImageLayers](https://images.microbadger.com/badges/image/aliascash/alias-builder-fedora.svg)](https://microbadger.com/#/images/aliascash/alias-builder-fedora) |
| Raspberry Pi | [![Docker Stars](https://img.shields.io/docker/stars/aliascash/alias-builder-raspi.svg)](https://hub.docker.com/r/aliascash/alias-builder-raspi/) | [![Docker Pulls](https://img.shields.io/docker/pulls/aliascash/alias-builder-raspi.svg)](https://hub.docker.com/r/aliascash/alias-builder-raspi/) | [![ImageLayers](https://images.microbadger.com/badges/image/aliascash/alias-builder-raspi.svg)](https://microbadger.com/#/images/aliascash/alias-builder-raspi)   |
| Ubuntu       | [![Docker Stars](https://img.shields.io/docker/stars/aliascash/alias-builder-ubuntu.svg)](https://hub.docker.com/r/aliascash/alias-builder-ubuntu/) | [![Docker Pulls](https://img.shields.io/docker/pulls/aliascash/alias-builder-ubuntu.svg)](https://hub.docker.com/r/aliascash/alias-builder-ubuntu/) | [![ImageLayers](https://images.microbadger.com/badges/image/aliascash/alias-builder-ubuntu.svg)](https://microbadger.com/#/images/aliascash/alias-builder-ubuntu) |

# Licensing

- SPDX-FileCopyrightText: © 2020 Alias Developers
- SPDX-FileCopyrightText: © 2016 SpectreCoin Developers

SPDX-License-Identifier: MIT

## Builder images for alias/aliasd compilation

This repository contains Dockerfiles to create builder images which could
be used to compile [aliasd](https://github.com/aliascash/alias)
for various distributions. So with each build of aliasd it is not
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
docker build \
    -f <distribution>/Dockerfile \
    -t aliascash/alias-builder-<distribution>:latest \
    .
```
