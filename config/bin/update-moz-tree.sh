#!/bin/sh

hg qpop -a && hg pull && hg update && touch configure && cd objdir-ff-debug && touch config.status && hg qpush -a && make -s -j8
