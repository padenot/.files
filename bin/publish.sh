#!/bin/sh

markdown $1 > /tmp/md.html

rep.py /tmp/md.html ~/bin/template.html XXX
