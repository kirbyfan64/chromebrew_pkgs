#!/bin/sh

set -e
VER='1.2.2'

for arch in armv7l i686 x86_64; do
    echo "********************$arch********************"
    fn=opam-$VER-$arch
    rm -rf $fn
    mkdir $fn
    cd $fn
    mkdir -p usr/local/bin
    url="https://github.com/ocaml/opam/releases/download/$VER/opam-$VER-$arch-Linux"
    curl -L $url > usr/local/bin/opam
    chmod +x usr/local/bin/opam
    sh ../pack.sh $fn
    cd ..
done
sh move.sh opam-$VER

