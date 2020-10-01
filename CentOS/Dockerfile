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

RUN yum -y install \
    epel-release

RUN yum update -y \
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

ENV PATH="/usr/local/openssl/bin:${PATH}"
