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
fi

PACKAGE=gominer
DATE=`date +%Y%m%d`
MAINDIR=$PACKAGE-$TAG
mkdir -p $MAINDIR
cd $MAINDIR

GPATH=$(echo $GOPATH | cut -f1 -d:)

i=linux-amd64
mkdir $PACKAGE-$i-$TAG
cd $PACKAGE-$i-$TAG
go build github.com/decred/gominer
cp $GPATH/src/github.com/decred/gominer/sample-gominer.conf .
cp $GPATH/src/github.com/decred/gominer/README.md .
cp $GPATH/src/github.com/decred/gominer/LICENSE .
cp $GPATH/src/github.com/decred/gominer/blake256.cl .
cd ..
tar -cvzf $PACKAGE-$i-$TAG.tar.gz $PACKAGE-$i-$TAG
sha256sum $PACKAGE-$i-$TAG.tar.gz > manifest-gominer-$TAG.txt
