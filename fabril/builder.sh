#!/bin/bash
export JAVA_HOME=/usr/lib/jvm/zulu-18/

SRC=src_app
VERSION=1.1.0
AMBIENTE=dev
APP_NAME=compra

SVN_URL=https://gitlab.com/developerfabril/qrk-compra.git

git config credential.helper store

mkdir -p $SRC

cd $SRC

git clone $SVN_URL

cd qrk-compra
