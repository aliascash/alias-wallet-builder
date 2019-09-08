FROM arm32v7/debian:stretch-slim
MAINTAINER HLXEasy <hlxeasy@gmail.com>

COPY RaspberryPi/qemu-arm-static /usr/bin

ENV WORK_DIR=/data/work

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

# Latest and greatest version of 'dialog' must be compiled explicitly
# as long as the official package contains 2016 code version.
# So install compile dependencies
RUN apt-get install -y --no-install-recommends \
    libncurses5-dev

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

# Download 'dialog' sources, compile and install
RUN cd /tmp/ \
 && wget https://invisible-island.net/datafiles/release/dialog.tar.gz \
 && cd / \
 && tar xzf /tmp/dialog.tar.gz \
 && mv /dialog-* /dialog \
 && cd /dialog \
 && ./configure \
 && make \
 && mkdir /newDialog \
 && make install DESTDIR=/newDialog/ \
 && rm -rf /tmp/dialog.tar.gz /dialog
