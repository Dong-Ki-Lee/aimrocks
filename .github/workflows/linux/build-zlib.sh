#!/bin/bash
set -e

export AIM_DEP_DIR=/opt/aimrocks_deps
export LD_LIBRARY_PATH=$AIM_DEP_DIR/lib:$LD_LIBRARY_PATH

cd $AIM_DEP_DIR
curl -L https://www.zlib.net/fossils/zlib-1.2.11.tar.gz -o zlib-1.2.11.tar.gz
tar zxvf zlib-1.2.11.tar.gz
cd zlib-1.2.11/
./configure
make CFLAGS="-fPIC" CXXFLAGS="-fPIC"
make install prefix=..
cd ../
rm -rf zlib-1.2.11 zlib-1.2.11.tar.gz
