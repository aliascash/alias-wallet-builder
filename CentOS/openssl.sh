# /etc/profile.d/openssl.sh
#Set OPENSSL_PATH
OPENSSL_PATH=/usr/local/ssl/bin
export OPENSSL_PATH
PATH=$PATH:${OPENSSL_PATH}
export PATH
