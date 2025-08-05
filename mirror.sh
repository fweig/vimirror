#!/bin/bash

# TODO: handle missing arguments
Source=$1
TargetDir=$2

TmpDir="/tmp/vim-packages"


rm -rf $TmpDir

git clone --quiet "$Source" "$TmpDir"
pushd "$TmpDir"
git submodule update --init --recursive
popd

mkdir -p "$TargetDir"

cp -r "$TmpDir"/* "$TargetDir/"

echo "Source=$Source" > "$TargetDir/.MANIFEST"

Commit=$(cd $TmpDir && git rev-parse HEAD)
echo "Commit=$Commit" >> "$TargetDir/.MANIFEST"

