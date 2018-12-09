FROM debian:stretch
MAINTAINER HLXEasy <hlxeasy@gmail.com>

ENV WORK_DIR=/data/work \
    DEBIAN_FRONTEND=noninteractive \
    LC_ALL=en_US.UTF-8

COPY Debian/stretch-backports.list /etc/apt/sources.list.d/
COPY Debian/testing.list /etc/apt/sources.list.d/

RUN apt-get update -y \
 && apt-get upgrade -y

RUN apt-get install -y --no-install-recommends \
    autoconf \
    automake \
    build-essential \
    ca-certificates \
    g++-8 \
    git \
    less \
    libboost1.67-all-dev \
    libcap-dev \
    libevent-dev \
    libqt5webchannel5-dev \
    libseccomp-dev \
    libssl-dev \
    libtool \
    libz-dev \
    locales \
    make \
    mc \
    openssh-client \
    pkg-config \
    qt5-default \
    qtbase5-dev \
    qttools5-dev-tools \
    qtwebengine5-dev \
    wget

# Set locale to UTF8
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
 && locale-gen en_US.UTF-8 \
 && dpkg-reconfigure locales \
 && /usr/sbin/update-locale LANG=en_US.UTF-8

# Cleanup system
RUN apt-get update -y \
 && apt-get autoclean -y \
 && apt-get clean -y \
 && apt-get autoremove -y
