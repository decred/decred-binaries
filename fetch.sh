#!/bin/bash

# Copyright (c) 2018 The Decred developers
# Use of this source code is governed by the ISC
# license.

PROJECTS="dcrd dcrwallet"

if [ -z "$TAG" ]; then
	echo "No tag set"
	BRANCH=""
else
	echo "Tag set to $TAG"
	BRANCH="--branch $TAG"
fi

mkdir -p $GOPATH/src/github.com/decred

for i in $PROJECTS; do
	PROJECT=$(echo $i)
	cd $GOPATH/src/github.com/decred

	# Only fetch if project doesn't exist:
	if [ ! -d "$PROJECT" ]; then
		echo "No repo found, so fetching $PROJECT"
		git clone --depth 1 $BRANCH https://github.com/decred/$PROJECT
		#git clone --depth 1 --branch $TAG https://github.com/decred/$PROJECT
	fi

	cd $PROJECT

	CURRENT_TAG=$(git describe --tags 2> /dev/null)
	# Check that the tag of this branch matches the provided tag:
	if [ -n "$TAG" ]; then
		echo "Verifying $PROJECT repo tag matches $TAG..."
		if [[ "$CURRENT_TAG" != "$TAG" ]]; then
			# Don't continue if tag of repo does not match
			echo "Repo tag of '$CURRENT_TAG' does not match specified tag of '$TAG'"
			exit 1
		else
			echo "...good."
		fi
	fi

	dep ensure
done
