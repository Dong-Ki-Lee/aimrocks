#!/bin/bash
set -e

export AIM_DEP_DIR=/opt/aimrocks_deps
export LD_LIBRARY_PATH=$AIM_DEP_DIR/lib:$LD_LIBRARY_PATH

cd $AIM_DEP_DIR
curl -L  https://github.com/lz4/lz4/archive/v1.9.3.tar.gz -o lz4-1.9.3.tar.gz
tar zxvf lz4-1.9.3.tar.gz
cd lz4-1.9.3
make CFLAGS="-fPIC" CXXFLAGS="-fPIC"
make PREFIX=$PWD/.. install
cd ..
rm -rf lz4-1.9.3 lz4-1.9.3.tar.gz
