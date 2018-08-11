#!/bin/bash

# Simple bash script to build Decred install tool for all the platforms
# we support with the golang cross-compiler.
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
    REL=(-ldflags "-X main.appBuild=")
fi

PACKAGE=dcrinstall
MAINDIR=$PACKAGE-$TAG
mkdir -p $MAINDIR
cd $MAINDIR

SYS="windows-386 windows-amd64 linux-386 linux-amd64 linux-arm linux-arm64 darwin-amd64"

# Use the first element of $GOPATH in the case where GOPATH is a list
# (something that is totally allowed).
GPATH=$(echo $GOPATH | cut -f1 -d:)

for i in $SYS; do
    OS=$(echo $i | cut -f1 -d-)
    ARCH=$(echo $i | cut -f2 -d-)
    echo "Building:" $OS $ARCH
    env GOOS=$OS GOARCH=$ARCH go build "${REL[@]}" github.com/decred/decred-release/cmd/dcrinstall
    if [[ $OS = "windows" ]]; then
	mv dcrinstall.exe dcrinstall-$i-$TAG.exe
    else
	mv dcrinstall dcrinstall-$i-$TAG
    fi
done

sha256sum * > manifest-dcrinstall-$TAG.txt

