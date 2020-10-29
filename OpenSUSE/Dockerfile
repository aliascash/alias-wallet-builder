# SPDX-FileCopyrightText: © 2020 Alias Developers
#
# SPDX-License-Identifier: MIT

FROM opensuse/tumbleweed:latest
MAINTAINER HLXEasy <hlxeasy@gmail.com>

ENV WORK_DIR=/data/work

USER 0

# Mount point for development workspace
RUN mkdir -p ${WORK_DIR}
VOLUME ${WORK_DIR}

RUN zypper install -y \
    autoconf \
    automake \
    cmake \
    diffutils \
    file \
    git \
    glibc-devel-static \
    less \
    libcap-devel \
    libseccomp-devel \
    libtool \
    make \
    mc \
    openssh-clients \
    patch \
    pkg-config \
    python3 \
    libqt5-linguist \
    libqt5-qtbase \
    libqt5-qtbase-devel \
    libqt5-qtdeclarative-devel \
    libqt5-qtquickcontrols \
    libqt5-qtsvg-devel \
    libqt5-qtwebchannel-devel \
    libqt5-qtwebsockets-devel \
    libqt5-qtwebview-devel \
    libQt5WebKit5-devel \
    wget \
    which \
 && zypper clean all

# Build dependencies and store them right on the builder image
WORKDIR /
RUN git clone https://github.com/aliascash/alias-wallet \
 && cd alias-wallet \
 && ./scripts/cmake-build.sh -d \
 && for i in $(ls -1 | grep -v cmake-build-cmdline) ; do rm -rf ${i} ; done \
 && for i in .* ; do rm -rf ${i} ; done
