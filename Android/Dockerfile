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
    autoconf \
    automake \
    autopoint \
    build-essential \
    ca-certificates \
    cmake \
    curl \
    git \
    locales \
    libtool \
    mc \
    openjdk-11-jdk \
    python3 \
    python3-pip \
    unzip \
    wget \
 && apt-get clean

# Set locale to UTF8
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
 && locale-gen en_US.UTF-8 \
 && dpkg-reconfigure locales \
 && /usr/sbin/update-locale LANG=en_US.UTF-8

# Install Qt
# https://github.com/miurahr/aqtinstall
RUN pip3 install aqtinstall \
 && aqt install --outputdir /root/Qt 5.15.2 linux android \

# Install Gradle
ENV GRADLE_VERSION=6.5 \
    GRADLE_HOME=/opt/gradle
RUN wget https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -P /tmp \
 && unzip -d /opt/ /tmp/gradle-*.zip \
 && rm -f /tmp/gradle-*.zip \
 && ln -s /opt/gradle-${GRADLE_VERSION} /opt/gradle

# Prepare dependencies for CMake build
WORKDIR /
RUN git clone https://github.com/aliascash/alias-wallet --branch downgradeTorVersion \
 && cd alias-wallet \
 && ./scripts/cmake-build-android_arm64.sh -d -t \
 && ./scripts/cmake-build-android_armv7.sh -d -t \
 && ./scripts/cmake-build-android_x86-64.sh -d -t \
 && for i in $(ls -1 | grep -v cmake-build-cmdline) ; do rm -rf ${i} ; done \
 && for i in .* ; do rm -rf ${i} ; done \
 && find /root/Archives/ -name "*.zip" -exec rm -f {} \; \
 && find /root/Archives/ -name "*.tar.gz" -exec rm -f {} \;
