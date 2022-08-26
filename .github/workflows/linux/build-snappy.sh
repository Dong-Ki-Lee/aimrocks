#!/bin/bash
set -e

export AIM_DEP_DIR=/opt/aimrocks_deps
export LD_LIBRARY_PATH=$AIM_DEP_DIR/lib:$LD_LIBRARY_PATH
export CMAKE=/home/ec2-user/cmake-3.24.1-linux-aarch64/bin/cmake

cd $AIM_DEP_DIR
curl -L https://github.com/google/snappy/archive/1.1.8.tar.gz -o snappy-1.1.8.tar.gz
tar zxvf snappy-1.1.8.tar.gz
cd snappy-1.1.8
mkdir build
cd build
$CMAKE -DCMAKE_INSTALL_PREFIX=../.. CFLAGS="-fPIC" CXXFLAGS="-fPIC" -DCMAKE_POSITION_INDEPENDENT_CODE=ON ..
make
make install
cd ../..
rm -rf snappy-1.1.8 snappy-1.1.8.tar.gz
