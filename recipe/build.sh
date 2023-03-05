#!/bin/bash

set -x

if [[ $(uname) == Linux ]]; then
    export CPPFLAGS="-DIN_EXCL_UNLINK=0x04000000 $CPPFLAGS"
    export LDFLAGS="-lrt $LDFLAGS"
fi

./configure \
    --prefix="$PREFIX" \
    --with-libgpg-error-prefix="$PREFIX" \
    --with-ntbtls-prefix="$PREFIX"
make
make install
