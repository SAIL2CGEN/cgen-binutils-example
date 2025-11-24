#!/bin/bash

wget https://sourceware.org/pub/binutils/releases/binutils-2.31.1.tar.bz2
tar -xzf binutils-2.31.tar.gz
rm binutils-2.25.tar.gz
wget https://sourceware.org/pub/cgen/snapshots/cgen-20180601.tar.bz2
mkdir cgen-20180601
tar -xvjf cgen-20180601.tar.bz2 -C ./cgen-20180601
rm cgen-1.1.tar.gz