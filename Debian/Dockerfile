FROM debian:stretch
MAINTAINER HLXEasy <hlxeasy@gmail.com>

ENV WORK_DIR=/data/work \
    DEBIAN_FRONTEND=noninteractive \
    LC_ALL=en_US.UTF-8

COPY Debian/stretch-backports.list /etc/apt/sources.list.d/

RUN apt-get update -y \
 && apt-get upgrade -y

RUN apt-get install -y --no-install-recommends \
    ca-certificates \
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
    mingw-w64 \
    mingw-w64-x86-64-dev \
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

# Add Debian testing and install gcc7 build toolchain from there
# This is done as a separate step as otherwise some of the other
# packages will bee too new (i. e. qt5)
COPY Debian/testing.list /etc/apt/sources.list.d/
RUN apt-get update -y
RUN apt-get install -y --no-install-recommends \
    autoconf \
    automake \
    build-essential \
    g++-7
