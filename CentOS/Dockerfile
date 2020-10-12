# SPDX-FileCopyrightText: © 2020 Alias Developers
# SPDX-FileCopyrightText: © 2016 SpectreCoin Developers
#
# SPDX-License-Identifier: MIT

FROM centos:8
MAINTAINER HLXEasy <hlxeasy@gmail.com>

ENV WORK_DIR=/data/work

USER 0

# Mount point for development workspace
RUN mkdir -p ${WORK_DIR}
VOLUME ${WORK_DIR}

RUN yum install -y \
    epel-release \
 && yum update -y \
 && yum install -y \
    autoconf \
    automake \
    boost-devel \
    diffutils \
    file \
    git \
    less \
    libcap-devel \
    libevent-devel \
    libseccomp-devel \
    libtool \
    libzstd-devel \
    make \
    mc \
    openssh-clients \
    openssl-devel \
    patch \
    perl-core \
    pkg-config \
    python3 \
    qt5-linguist \
    qt5-qtbase \
    qt5-qtbase-devel \
    qt5-qtdeclarative-devel \
    qt5-qtquickcontrols \
    qt5-qtsvg-devel \
    qt5-qtwebchannel-devel \
    qt5-qtwebkit-devel \
    qt5-qtwebsockets-devel \
    qt5-qtwebview-devel \
    wget \
    which \
    zlib-devel \
 && yum clean all

ENV PATH="/usr/local/openssl/bin:${PATH}" \
    CMAKE_VERSION=3.18.4

# Default CMake is too old
RUN wget https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}.tar.gz
 && tar -zxvf cmake-${CMAKE_VERSION}.tar.gz \
 && cd cmake-${CMAKE_VERSION} \
 && ./bootstrap \
 && make \
 && make install \
 && rm -rf cmake-${CMAKE_VERSION}* \
 && cmake --version

# For static linking
RUN sed "s/enabled=0/enabled=1/g" /etc/yum.repos.d/CentOS-PowerTools.repo \
 && yum update -y \
 && yum install -y \
    glibc-static \
    libstdc++-static \
 && yum clean all

# Build dependencies and store them right on the builder image
WORKDIR /
RUN git clone https://github.com/aliascash/alias-wallet --branch cmake-build \
 && cd alias-wallet \
 && ./scripts/cmake-build.sh -d \
 && for i in $(ls -1 | grep -v cmake-build-cmdline) ; do rm -rf ${i} ; done \
 && for i in .* ; do rm -rf ${i} ; done
