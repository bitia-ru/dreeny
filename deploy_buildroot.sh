#!/bin/bash

set -e

BR_NAME=buildroot-2017.02.9.tar.bz2

test -r ${BR_NAME} || wget https://buildroot.org/downloads/${BR_NAME}

tar xvf ${BR_NAME}

cd ${BR_NAME%.tar.*}

if ls ../buildroot-patches/*.patch &>/dev/null; then
  for p in ../buildroot-patches/*.patch; do
    patch -Np1 -i ${p}
  done
fi

rm -rf board/* configs/*

echo -e "\n\n\n\n"
make BR2_EXTERNAL=../overlay list-defconfigs

echo "Now cd ${BR_NAME%.tar.*} and have fun."
echo ""
