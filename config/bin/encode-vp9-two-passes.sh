#!/bin/bash -ex

in=$1
out=${in%.*}.webm

if [[ -n $2 ]]
then
  re='^[0-9]+$'
  if ! [[ $2 =~ $re ]] ; then
     echo "error: width is not a number" >&2; exit 1
  fi
  resize="-vf scale=$2:-1"
else
  resize=""
fi

time ffmpeg -i $in $resize -b:v 3000k \
  -minrate 1500k -maxrate 4350k -tile-columns 2 -g 240 -threads 8 \
  -quality good -crf 31 -c:v libvpx-vp9 -c:a libopus \
  -pass 1 -speed 4 $out
time ffmpeg -i $in $resize -b:v 3000k \
  -minrate 1500k -maxrate 4350k -tile-columns 3 -g 240 -threads 8 \
  -quality good -crf 31 -c:v libvpx-vp9 -c:a libopus \
  -pass 2 -speed 4 -y $out
