FROM centos:7
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
    qt5-qtwebengine-devel \
    wget
