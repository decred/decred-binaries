#!/bin/bash

# Simple bash script to build and package Decred gominer for all the platforms
# we support.
#
# Currently gominer cannot be cross compiled so any additional platforms must be
# built and copied over manually.
#
# Copyright (c) 2016 The Decred developers
# Use of this source code is governed by the ISC
# license.

# If no tag specified, use date + version otherwise use tag.
if [[ $1x = x ]]; then
    DATE=`date +%Y%m%d`
    VERSION="01"
    TAG=$DATE-$VERSION
else
    TAG=$1
    REL=(-ldflags "-X main.appBuild=release")
fi

PACKAGE=gominer
DATE=`date +%Y%m%d`
MAINDIR=$PACKAGE-$TAG
mkdir -p $MAINDIR
cd $MAINDIR

GPATH=$(echo $GOPATH | cut -f1 -d:)

OS=linux-amd64
TYPE=opencl
echo Building $OS-$TYPE
mkdir $PACKAGE-$OS-$TYPE-$TAG
cd $PACKAGE-$OS-$TYPE-$TAG
go build -tags "$TYPE" "${REL[@]}" github.com/decred/gominer
cp $GPATH/src/github.com/decred/gominer/sample-gominer.conf .
cp $GPATH/src/github.com/decred/gominer/README.md .
cp $GPATH/src/github.com/decred/gominer/LICENSE .
cp $GPATH/src/github.com/decred/gominer/blake256.cl .
cp $GPATH/src/github.com/decred/gominer/blake256-old.cl .
cd ..
tar -czf $PACKAGE-$OS-$TYPE-$TAG.tar.gz $PACKAGE-$OS-$TYPE-$TAG
rm -r $PACKAGE-$OS-$TYPE-$TAG

SYS="windows-amd64_opencl_zip windows-amd64_cuda_zip linux-amd64_cuda_tar.gz windows-amd64_opencladl_zip linux-amd64_opencladl_tar.gz"

for i in $SYS; do
    OS=$(echo $i | cut -f1 -d_)
    TYPE=$(echo $i | cut -f2 -d_)
    EXT=$(echo $i | cut -f3 -d_)
    CPACKAGE=$PACKAGE-$OS-$TYPE-$TAG.$EXT
    if [ -e ../$CPACKAGE ]; then
	mv ../$CPACKAGE .
	echo Found $CPACKAGE
    else
	echo Missing $CPACKAGE
    fi
done

sha256sum * > manifest-gominer-$TAG.txt
