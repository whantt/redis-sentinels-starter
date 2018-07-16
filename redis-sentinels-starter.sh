#! /bin/bash

ROOT_DIR=`pwd`
TMP_DIR=`echo ${ROOT_DIR}/tmp`
BIN_DIR=`echo ${ROOT_DIR}/bin`
CONF_DIR=`echo ${ROOT_DIR}/conf`
rm -rf ${TMP_DIR}
mkdir -p ${TMP_DIR}
cd ${TMP_DIR}
wget http://download.redis.io/releases/redis-4.0.10.tar.gz
tar -xzvf redis-4.0.10.tar.gz
cd redis-4.0.10
make
mkdir -p ${BIN_DIR}
mv -f src/redis-benchmark ${BIN_DIR}/redis-benchmark
mv -f src/redis-cli ${BIN_DIR}/redis-cli
mv -f src/redis-server ${BIN_DIR}/redis-server
mv -f src/redis-sentinel ${BIN_DIR}/redis-sentinel

cd ${ROOT_DIR}
./bin/redis-server ${CONF_DIR}/redis-master.conf &
./bin/redis-server ${CONF_DIR}/redis-slave-1.conf &
./bin/redis-server ${CONF_DIR}/redis-slave-2.conf &
./bin/redis-sentinel ${CONF_DIR}/sentinel-1.conf &
./bin/redis-sentinel ${CONF_DIR}/sentinel-2.conf &
./bin/redis-sentinel ${CONF_DIR}/sentinel-3.conf &
