#! /bin/sh

# Clear the disk caches

sync
echo 3 > /proc/sys/vm/drop_caches
