#!/bin/bash -ex

# $1 file to encode
# $2 width of the output video in pixels

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

time ffmpeg -i $in -b:v 800k $resize  -minrate 300k -maxrate 2610k -tile-columns 2 -g 240 -threads 8 -quality best -crf 22 -c:v libvpx-vp9 -c:a libopus   -pass 1 -speed 0 $out
time ffmpeg -i $in -b:v 800k $resize  -minrate 300k -maxrate 2610k -tile-columns 3 -g 240 -threads 8 -quality best -crf 22 -c:v libvpx-vp9 -c:a libopus   -pass 2 -speed 0 -y $out


# ffmpeg -i $in $resize -threads 8 -c:v libvpx-vp9 -b:v 0 -crf 30 -pass 1 -an -f webm /dev/null && \
# ffmpeg -i $in $resize -threads 8 -c:v libvpx-vp9 -b:v 0 -crf 30 -pass 2 -c:a libopus $out
