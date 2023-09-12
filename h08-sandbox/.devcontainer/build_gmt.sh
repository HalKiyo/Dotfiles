#!/bin/bash
# -------------------------------
GMT_VERSION=6.4.0
GSHHG_VERSION=2.3.7
DCW_VERSION=2.1.1
# --------------------------------------------------
GSHHG_ROOT=/tmp/gshhg-gmt-${GSHHG_VERSION}
DCW_ROOT=/tmp/dcw-gmt-${DCW_VERSION}
tar xvzf /tmp/gshhg-gmt-${GSHHG_VERSION}.tar.gz -C /tmp
tar xvzf /tmp/dcw-gmt-${DCW_VERSION}.tar.gz -C /tmp
tar xvzf /tmp/gmt-${GMT_VERSION}-src.tar.gz -C /tmp
cd /tmp/gmt-${GMT_VERSION}
cat ./cmake/ConfigUserTemplate.cmake | \
sed -e 's%\#set (GSHHG_ROOT "gshhg_path"%'"set (GSHHG_ROOT ${GSHHG_ROOT}"'%g' | \
sed -e 's/\#set (COPY_GSHHG FALSE)/set (COPY_GSHHG TRUE)/g' | \
sed -e 's%\#set (DCW_ROOT "dcw-gmt_path"%'"set (DCW_ROOT ${DCW_ROOT}"'%g' | \
sed -e 's/\#set (COPY_DCW FALSE)/set (COPY_DCW TRUE)/g' \
> ./cmake/ConfigUser.cmake
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr/local -DCMAKE_BUILD_TYPE=RelWithDebInfo ..
ncpu=$(nproc)
make -j${ncpu}
make -j${ncpu} install
