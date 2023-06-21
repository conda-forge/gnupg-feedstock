#!/bin/bash
# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* ./scripts

set -x

if [[ $(uname) == Linux ]]; then
    export CPPFLAGS="-DIN_EXCL_UNLINK=0x04000000 $CPPFLAGS"
    export LDFLAGS="-lrt $LDFLAGS"
fi

./configure \
    --prefix="$PREFIX" \
    --program-suffix=1 \
    --with-libgpg-error-prefix="$PREFIX" \
    --with-ntbtls-prefix="$PREFIX"
make
make install
