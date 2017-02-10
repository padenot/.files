#!/bin/sh

mkdir out

for i in `ls *.png`
do
	convert $i -negate out/$i
done
