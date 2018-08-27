FROM arm32v7/debian:stretch-slim
MAINTAINER HLXEasy <hlxeasy@gmail.com>

COPY RaspberryPi/qemu-arm-static /usr/bin

ENV WORK_DIR=/data/work

# Mount point for development workspace
RUN mkdir -p ${WORK_DIR}
VOLUME ${WORK_DIR}

RUN apt-get update -y \
 && apt-get upgrade -y

RUN apt-get install -y --no-install-recommends \
    autoconf \
    autogen \
    automake \
    build-essential \
    ca-certificates \
    g++ \
    git \
    less \
    libboost-chrono-dev \
    libboost-dev \
    libboost-filesystem-dev \
    libboost-iostreams-dev \
    libboost-program-options-dev \
    libboost-system-dev \
    libboost-thread-dev \
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
