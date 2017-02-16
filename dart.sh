#!/bin/sh

set -e
VER=1.22.0

for arch in arm ia32 x64; do
    echo "********************$arch********************"
    rm -rf dart-$arch.zip dart-$arch dart-$arch.tgz
    url="https://storage.googleapis.com/dart-archive/channels/stable/release/$VER/sdk/dartsdk-linux-$arch-release.zip"
    curl -L $url > dart-$arch.zip
    unzip dart-$arch.zip
    mv dart-sdk dart-$arch
    cd dart-$arch
    rm LICENSE README revision version
    rmdir util
    mkdir usr
    mv bin include lib usr
    tar cvzf ../dart-$arch.tgz usr
    cd ..
done
cp -v *.tgz ~/Downloads

