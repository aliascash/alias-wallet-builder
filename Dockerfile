FROM debian:stretch
MAINTAINER HLXEasy <hlxeasy@gmail.com>

ENV WORK_DIR=/data/work \
    DEBIAN_FRONTEND=noninteractive \
    PERL_USE_UNSAFE_INC=1 \
    LC_ALL=en_US.UTF-8 \
    TZ='Europe/Berlin'

# Mount point for development workspace
RUN mkdir -p ${WORK_DIR}
VOLUME ${WORK_DIR}

RUN apt-get update -y \
 && apt-get upgrade -y

RUN apt-get install -y --no-install-recommends \
    locales \
    mc \
    g++ \
    git \
    build-essential \
    libssl-dev \
    libevent-dev \
    libseccomp-dev \
    libcap-dev \
    libicu-dev \
    libbz2-dev \
    pkg-config \
    autoconf \
    automake \
    autotools-dev \
    libtool \
    ca-certificates \
    zlib1g-dev \
    qtbase5-dev \
    qttools5-dev \
    qtchooser \
    qtbase5-dev-tools \
    qtwebengine5-dev \
    mingw-w64 \
    mingw-w64-x86-64-dev \
    python-dev \
    wget
