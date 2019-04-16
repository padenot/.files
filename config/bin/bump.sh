#!/bin/sh

usage() {
  echo $0 "<crate-name>" "<crate-version>"
  exit 1
}

if [ $# -ne 2 ]
then
  usage $0
fi

CRATE="$1"
VERSION="$2"

files=$(find . -name "Cargo.toml")

for i in $files
do
  sed -i "s!$CRATE = \"\(.*\)\"!$CRATE = $VERSION!" $i
done
