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

RUN wget -O boost_1_67_0.tar.gz http://sourceforge.net/projects/boost/files/boost/1.67.0/boost_1_67_0.tar.gz/download --no-check-certificate \
 && tar xzvf boost_1_67_0.tar.gz \
 && cd boost_1_67_0/ \
 && ./bootstrap.sh --prefix=/usr/local \
 && ./b2 --with=all -j 2 install

# Set locale to UTF8
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
 && locale-gen en_US.UTF-8 \
 && dpkg-reconfigure locales \
 && /usr/sbin/update-locale LANG=en_US.UTF-8

# Set timezone to Europe/Berlin
RUN echo $TZ > /etc/timezone && \
    rm /etc/localtime && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata
