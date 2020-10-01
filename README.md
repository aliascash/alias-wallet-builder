# Alias builder image

Build status: [![Build Status](https://ci.alias.cash/buildStatus/icon?job=Alias/alias-wallet-builder/develop&build=10)](https://ci.alias.cash/job/Alias/job/alias-wallet-builder/job/develop/)

|                |   |   |    |
|:--             |:--|:--|:---|
| CentOS 8       | [![Docker Stars](https://img.shields.io/docker/stars/aliascash/alias-wallet-builder-centos-8.svg)](https://hub.docker.com/r/aliascash/alias-wallet-builder-centos-8/) | [![Docker Pulls](https://img.shields.io/docker/pulls/aliascash/alias-wallet-builder-centos-8.svg)](https://hub.docker.com/r/aliascash/alias-wallet-builder-centos-8/) | [![ImageLayers](https://images.microbadger.com/badges/image/aliascash/alias-wallet-builder-centos-8.svg)](https://microbadger.com/#/images/aliascash/alias-wallet-builder-centos-8) |
| Debian Stretch | [![Docker Stars](https://img.shields.io/docker/stars/aliascash/alias-wallet-builder-debian-stretch.svg)](https://hub.docker.com/r/aliascash/alias-wallet-builder-debian-stretch/) | [![Docker Pulls](https://img.shields.io/docker/pulls/aliascash/alias-wallet-builder-debian-stretch.svg)](https://hub.docker.com/r/aliascash/alias-wallet-builder-debian-stretch/) | [![ImageLayers](https://images.microbadger.com/badges/image/aliascash/alias-wallet-builder-debian-stretch.svg)](https://microbadger.com/#/images/aliascash/alias-wallet-builder-debian-stretch) |
| Debian Buster  | [![Docker Stars](https://img.shields.io/docker/stars/aliascash/alias-wallet-builder-debian-buster.svg)](https://hub.docker.com/r/aliascash/alias-wallet-builder-debian-buster/) | [![Docker Pulls](https://img.shields.io/docker/pulls/aliascash/alias-wallet-builder-debian-buster.svg)](https://hub.docker.com/r/aliascash/alias-wallet-builder-debian-buster/) | [![ImageLayers](https://images.microbadger.com/badges/image/aliascash/alias-wallet-builder-debian-buster.svg)](https://microbadger.com/#/images/aliascash/alias-wallet-builder-debian-buster) |
| Fedora         | [![Docker Stars](https://img.shields.io/docker/stars/aliascash/alias-wallet-builder-fedora.svg)](https://hub.docker.com/r/aliascash/alias-wallet-builder-fedora/) | [![Docker Pulls](https://img.shields.io/docker/pulls/aliascash/alias-wallet-builder-fedora.svg)](https://hub.docker.com/r/aliascash/alias-wallet-builder-fedora/) | [![ImageLayers](https://images.microbadger.com/badges/image/aliascash/alias-wallet-builder-fedora.svg)](https://microbadger.com/#/images/aliascash/alias-wallet-builder-fedora) |
| Raspberry Pi   | [![Docker Stars](https://img.shields.io/docker/stars/aliascash/alias-wallet-builder-raspi.svg)](https://hub.docker.com/r/aliascash/alias-wallet-builder-raspi/) | [![Docker Pulls](https://img.shields.io/docker/pulls/aliascash/alias-wallet-builder-raspi.svg)](https://hub.docker.com/r/aliascash/alias-wallet-builder-raspi/) | [![ImageLayers](https://images.microbadger.com/badges/image/aliascash/alias-wallet-builder-raspi.svg)](https://microbadger.com/#/images/aliascash/alias-wallet-builder-raspi)   |
| Ubuntu 18.04   | [![Docker Stars](https://img.shields.io/docker/stars/aliascash/alias-wallet-builder-ubuntu-18-04.svg)](https://hub.docker.com/r/aliascash/alias-wallet-builder-ubuntu-18-04/) | [![Docker Pulls](https://img.shields.io/docker/pulls/aliascash/alias-wallet-builder-ubuntu-18-04.svg)](https://hub.docker.com/r/aliascash/alias-wallet-builder-ubuntu-18-04/) | [![ImageLayers](https://images.microbadger.com/badges/image/aliascash/alias-wallet-builder-ubuntu-18-04.svg)](https://microbadger.com/#/images/aliascash/alias-wallet-builder-ubuntu-18-04) |
| Ubuntu 20.04   | [![Docker Stars](https://img.shields.io/docker/stars/aliascash/alias-wallet-builder-ubuntu-20-04.svg)](https://hub.docker.com/r/aliascash/alias-wallet-builder-ubuntu-20-04/) | [![Docker Pulls](https://img.shields.io/docker/pulls/aliascash/alias-wallet-builder-ubuntu-20-04.svg)](https://hub.docker.com/r/aliascash/alias-wallet-builder-ubuntu-20-04/) | [![ImageLayers](https://images.microbadger.com/badges/image/aliascash/alias-wallet-builder-ubuntu-20-04.svg)](https://microbadger.com/#/images/aliascash/alias-wallet-builder-ubuntu-20-04) |

# Licensing

- SPDX-FileCopyrightText: © 2020 Alias Developers
- SPDX-FileCopyrightText: © 2016 SpectreCoin Developers

SPDX-License-Identifier: MIT

## Builder images for aliaswallet/aliaswalletd compilation

This repository contains Dockerfiles to create builder images which could
be used to compile [Alias wallet and daemon](https://github.com/aliascash/alias-wallet)
for various distributions. So with each build of Alias it is not
necessary to setup the required build environment again and again.

## Facts
* Dockerfiles for the following distributions
  * CentOS 8
  * Debian Stretch
  * Debian Buster
  * Fedora 32
  * Raspberry Pi
  * Ubuntu 18.04
  * Ubuntu 20.04
* Installs all required default dependencies

## How it is build
```
docker build \
    -f <distribution>/Dockerfile \
    -t aliascash/alias-wallet-builder-<distribution>:latest \
    .
```
