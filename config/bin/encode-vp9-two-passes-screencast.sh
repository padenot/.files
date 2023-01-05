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


ffmpeg -i $in $resize -b:v 4000k -minrate 1500k -maxrate 5350k -tile-columns 2 -g 240 -threads 8 -pix_fmt yuv420p -quality good -crf 20 -c:v libvpx-vp9 -c:a libopus -pass 1 -speed 4 $out 
ffmpeg -i $in $resize -b:v 4000k -minrate 1500k -maxrate 5350k -tile-columns 3 -g 240 -threads 8 -pix_fmt yuv420p -quality good -crf 20 -c:v libvpx-vp9 -c:a libopus -pass 2 -speed 4 -y $out

# time ffmpeg -i $in $resize -t 0:10 -tile-columns 2 -g 240 -threads 8 -pix_fmt yuv420p -crf 10 -c:v libvpx-vp9 -c:a libopus  -pass 1 $out
# time ffmpeg -i $in $resize -t 0:10 -tile-columns 3 -g 240 -threads 8 -pix_fmt yuv420p -crf 10 -c:v libvpx-vp9 -c:a libopus  -pass 2 -y $out


# ffmpeg -i $in $resize -threads 8 -c:v libvpx-vp9 -b:v 0 -crf 30 -pass 1 -an -f webm /dev/null && \
# ffmpeg -i $in $resize -threads 8 -c:v libvpx-vp9 -b:v 0 -crf 30 -pass 2 -c:a libopus $out
