#!/bin/sh

CPUCOUNT=`cat /proc/cpuinfo | grep -c processor`

for i in `seq 0 $((CPUCOUNT - 1))`
do
  sudo cpufreq-set -c $i -g performance
done
