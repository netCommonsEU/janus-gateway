#!/bin/sh

srcdir=`dirname $0`
test -z "$srcdir" && srcdir=.

mkdir -p m4

## Building dependencies
git submodule init $srcdir/Libs/libsrtp
git submodule update $srcdir/Libs/libsrtp
DIR=$(pwd) && cd $srcdir/Libs/libsrtp/ && ./configure --prefix=$DIR/$srcdir/Libs/libsrtp/; cd $DIR
make -C $srcdir/Libs/libsrtp
ln -s $(pwd)/Libs/libsrtp/include $srcdir/Libs/libsrtp/srtp2
##

DIR=$(pwd) && cd $srcdir && autoreconf --verbose --force --install || exit 1; cd $DIR
