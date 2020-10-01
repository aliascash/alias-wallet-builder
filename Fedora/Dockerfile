# SPDX-FileCopyrightText: © 2020 Alias Developers
# SPDX-FileCopyrightText: © 2016 SpectreCoin Developers
#
# SPDX-License-Identifier: MIT

FROM fedora:32
MAINTAINER HLXEasy <hlxeasy@gmail.com>

ENV WORK_DIR=/data/work \
    DEBIAN_FRONTEND=noninteractive \
    LC_ALL=en_US.UTF-8

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
    wget
