#!/bin/bash

set -x

if [[ $(uname) == Linux ]]; then
    export CPPFLAGS="-DIN_EXCL_UNLINK=0x04000000 $CPPFLAGS"
    export LDFLAGS="-lrt $LDFLAGS"
fi

./configure --prefix="$PREFIX"
make
make install
