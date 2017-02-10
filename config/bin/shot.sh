#!/bin/sh

# Usage : shot.sh, select a zone of the screen.

filename="`date +%s`.png"

scrot -s -q 100 /tmp/$filename
cd /tmp/
up $filename

if [ $? = "0" ]
then
  rm /tmp/$filename
else
  echo "Could not upload the file /tmp/$filename"
fi
