#!/bin/sh
wget https://github.com/typst/typst/releases/latest/download/typst-x86_64-unknown-linux-musl.tar.xz

tar -xf typst-x86_64-unknown-linux-musl.tar.xz
cd typst-x86_64-unknown-linux-musl

sudo mv typst /usr/local/bin/

typst --version
