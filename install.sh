#!/bin/bash
SRC_DIR=/usr/local/src/goenv
BIN_DIR=/usr/local/bin
set -xe
mkdir -p $SRC_DIR && cd $SRC_DIR
curl -0 https://raw.githubusercontent.com/snormore/goenv/master/goenv.sh > goenv.sh
go build -a -o goenv
cp goenv $BIN_DIR/goenv
chmod +x $BIN_DIR/goenv
