#!/bin/sh -e


hg qpop -a

if [ -z $1 ]
then
hg commit --mq -m "$1"
else
hg commit --mq -m "update"
fi

hg push --mq

hg qpush -a
