# SPDX-FileCopyrightText: © 2020 Alias Developers
#
# SPDX-License-Identifier: MIT

FROM ubuntu:20.04
MAINTAINER HLXEasy <hlxeasy@gmail.com>

ENV WORK_DIR=/data/work \
    DEBIAN_FRONTEND=noninteractive \
    LC_ALL=en_US.UTF-8

RUN apt-get update -y \
 && apt-get upgrade -y \
 && apt-get clean

RUN apt-get install -y \
    build-essential \
    ca-certificates \
    cmake \
    curl \
    git \
    locales \
    mc \
    python3 \
    unzip \
    wget \
 && apt-get clean

# Set locale to UTF8
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
 && locale-gen en_US.UTF-8 \
 && dpkg-reconfigure locales \
 && /usr/sbin/update-locale LANG=en_US.UTF-8

# Prepare dependencies for CMake build
WORKDIR /
RUN git clone https://github.com/aliascash/alias-wallet \
 && cd alias-wallet \
 && ./scripts/cmake-build-android_arm64.sh -d -t \
 && ./scripts/cmake-build-android_armv7.sh -d -t \
 && ./scripts/cmake-build-android_x86-64.sh -d -t \
 && for i in $(ls -1 | grep -v cmake-build-cmdline) ; do rm -rf ${i} ; done \
 && for i in .* ; do rm -rf ${i} ; done \
 && find /root/Archives/ -name "*.zip" -exec rm -f {} \; \
 && find /root/Archives/ -name "*.tar.gz" -exec rm -f {} \;
