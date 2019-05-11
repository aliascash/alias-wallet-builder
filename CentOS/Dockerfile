FROM centos/devtoolset-7-toolchain-centos7:7
MAINTAINER HLXEasy <hlxeasy@gmail.com>

ENV WORK_DIR=/data/work \
    DEBIAN_FRONTEND=noninteractive \
    LC_ALL=en_US.UTF-8

USER 0

# Mount point for development workspace
RUN mkdir -p ${WORK_DIR}
VOLUME ${WORK_DIR}

RUN yum update -y

RUN yum install -y \
    autoconf \
    automake \
    boost-devel \
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
    patch \
    pkg-config \
    qt5 \
    qt5-devel \
    qt5-qtwebengine-devel \
    wget \
    which

RUN yum install -y \
    libtool \
    perl-core \
    zlib-devel \
 && cd /usr/local/src \
 && wget https://www.openssl.org/source/openssl-1.1.1.tar.gz \
 && tar -zxvf openssl-1.1.1.tar.gz \
 && cd openssl-1.1.1 \
 && ./config --prefix=/usr/local/openssl --openssldir=/usr/local/openssl shared zlib \
 && make \
 && make install

COPY CentOS/openssl.sh /etc/profile.d/
COPY CentOS/openssl-1.1.1.conf /etc/ld.so.conf.d/

RUN . /etc/profile \
 && ldconfig -v \
 && chmod +x /etc/profile.d/openssl.sh \
 && source /etc/profile.d/openssl.sh

ENV PATH="/usr/local/openssl/bin:${PATH}"
