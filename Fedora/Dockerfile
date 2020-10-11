# SPDX-FileCopyrightText: © 2020 Alias Developers
# SPDX-FileCopyrightText: © 2016 SpectreCoin Developers
#
# SPDX-License-Identifier: MIT

FROM fedora:32
MAINTAINER HLXEasy <hlxeasy@gmail.com>

ENV WORK_DIR=/data/work \
    DEBIAN_FRONTEND=noninteractive

# Mount point for development workspace
RUN mkdir -p ${WORK_DIR}
VOLUME ${WORK_DIR}

RUN yum update -y

RUN yum install -y \
    autoconf \
    automake \
    boost-devel \
    gcc-c++ \
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
    perl-Module-Load-Conditional \
    pkg-config \
    qt5 \
    qt5-devel \
    qt5-qtbase-devel \
    qt5-qtdeclarative-devel \
    qt5-qtnetworkauth-devel \
    qt5-qtquickcontrols \
    qt5-qtsvg-devel \
    qt5-qtwebchannel-devel \
    qt5-qtwebengine-devel \
    qt5-qtwebsockets-devel \
    qt5-qtwebview-devel \
    wget \
    which

# Prepare dependencies for CMake build
WORKDIR /
RUN git clone https://github.com/aliascash/alias-wallet --branch cmake-build \
 && cd alias-wallet \
 && ./scripts/cmake-build.sh -d \
 && for i in $(ls -1 | grep -v cmake-build-cmdline) ; do rm -rf ${i} ; done \
 && for i in .* ; do rm -rf ${i} ; done
