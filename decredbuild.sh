#!/bin/bash

set -ex

# Simple bash script to build basic Decred tools for all the platforms
# we support with the golang cross-compiler.
#
# Copyright (c) 2016-2017 The Decred developers
# Use of this source code is governed by the ISC
# license.

if [[ $# -ne 1 ]]; then
	echo 'Please specify a version'
	exit 1
fi

# GOPATH is currently required
if [ -z "$GOPATH" ]; then
	echo 'Please set GOPATH'
	exit 1
fi

CWD=$PWD
TAG=$1
PACKAGE=decred
MAINDIR=$PACKAGE-$TAG
GO111MODULE=on
REL=(-ldflags "-X github.com/decred/dcrd/internal/version.BuildMetadata=release -X github.com/decred/dcrd/internal/version.PreRelease=")
DCRWALLET_REL=(-ldflags "-X github.com/decred/dcrwallet/version.BuildMetadata=release -X github.com/decred/dcrwallet/version.PreRelease=")

mkdir -p $MAINDIR

SYS="windows-386 windows-amd64 linux-386 linux-amd64 linux-arm linux-arm64 darwin-amd64 freebsd-amd64 openbsd-amd64"

mkdir -p "$GOPATH/src/github.com/decred/"
cd "$GOPATH/src/github.com/decred/"
rm -r dcrd dcrwallet

git clone -b release-v1.4 https://github.com/decred/dcrd
git clone -b release-v1.4 https://github.com/decred/dcrwallet

for i in $SYS; do
    OS=$(echo $i | cut -f1 -d-)
    ARCH=$(echo $i | cut -f2 -d-)
    mkdir -p $CWD/$PACKAGE-$i-$TAG
    echo "Building:" $OS $ARCH ${REL[@]}
    EXT=""
    if [[ $OS = "windows" ]]; then
      EXT=".exe"
    fi
    rm $PACKAGE-$i-$TAG

    # dcrd
    cd $GOPATH/src/github.com/decred/dcrd
    env GO111MODULE=on GOOS=$OS GOARCH=$ARCH go build "${REL[@]}"
    cp dcrd$EXT $CWD/$PACKAGE-$i-$TAG

    # dcrctl
    cd $GOPATH/src/github.com/decred/dcrd/cmd/dcrctl
    env GO111MODULE=on GOOS=$OS GOARCH=$ARCH go build "${REL[@]}"
    cp dcrctl$EXT sample-dcrctl.conf $CWD/$PACKAGE-$i-$TAG

    # promptsecret
    cd $GOPATH/src/github.com/decred/dcrd/cmd/promptsecret
    env GO111MODULE=on GOOS=$OS GOARCH=$ARCH go build "${REL[@]}"
    cp promptsecret$EXT $CWD/$PACKAGE-$i-$TAG

    # dcrwallet
    cd $GOPATH/src/github.com/decred/dcrwallet
    env GO111MODULE=on GOOS=$OS GOARCH=$ARCH go build "${DCRWALLET_REL[@]}"
    cp dcrwallet$EXT sample-dcrwallet.conf $CWD/$PACKAGE-$i-$TAG

    if [[ $OS = "windows" ]]; then
       (cd $CWD && zip -r $MAINDIR/$PACKAGE-$i-$TAG.zip $PACKAGE-$i-$TAG)
    else
       (cd $CWD && tar -cvzf $MAINDIR/$PACKAGE-$i-$TAG.tar.gz $PACKAGE-$i-$TAG)
    fi
    rm $CWD/$PACKAGE-$i-$TAG/*
    rmdir $CWD/$PACKAGE-$i-$TAG
done

cd $CWD/$MAINDIR
sha256sum * > manifest-$TAG.txt
