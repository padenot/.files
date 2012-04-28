#!/bin/sh
if [ $# -ne 1 ]
then
  echo "usage: $0  packagename.of.your.activity"
  echo "for example:"
  echo "  $0 org.mozilla.fennec"
  exit
fi

p=`adb shell ps | grep $1 | awk '{print $2}'`
if [ "$p" = "" ];
then
  echo "ERROR: That doesn't seem to be a running process. Please make sure your"
  echo "application has been started and that you are using the correct"
  echo "namespace argument."
  exit
fi

adb shell run-as $1 kill $p
