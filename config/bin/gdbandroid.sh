#!/bin/bash
PORT=1234
PID=""

# By default, this will attach to the parent process.
# Use "plugin-container" as argument to attach to child.
if [ -z $1 ]; then
  GREP=org.mozilla.fennec
else
  GREP=$1
fi

adb forward tcp:$PORT tcp:$PORT && adb shell am start -a org.mozilla.gecko.DEBUG -n org.mozilla.fennec/org.mozilla.fennec.App &&
while [ -z $PID ]; do
  PID=`adb shell ps | grep $GREP | head -n 1 | cut -c11-16`
done &&
adb shell run-as org.mozilla.fennec /data/local/gdbserver localhost:$PORT --attach $PID
