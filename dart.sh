#!/bin/sh

set -e
VER=1.22.0

for arch in arm ia32 x64; do
    echo "********************$arch********************"
    fn=dart-$VER-$arch
    rm -rf $fn $fn.zip $fn.tgz
    url="https://storage.googleapis.com/dart-archive/channels/stable/release/$VER/sdk/dartsdk-linux-$arch-release.zip"
    curl -L $url > $fn.zip
    unzip $fn.zip
    mv dart-sdk $fn
    cd $fn
    rm LICENSE README revision version
    rmdir util
    mkdir usr
    mv bin include lib usr
    sh ../pack.sh $fn
    cd ..
done
sh move.sh dart-$VER

