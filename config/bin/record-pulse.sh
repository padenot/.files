#!/bin/bash
WAV="$1"
if [ -z "$WAV" ]; then
    echo "Usage: $0 OUTPUT.WAV" >&2
    exit 1
fi
rm -f "$WAV"

MONITOR=$(pactl list | egrep -A2 '^(\*\*\* )?Source #' | \
    grep 'Name: .*\.monitor$' | awk '{print $NF}' | tail -n1)
echo "set-source-mute ${MONITOR} false" | pacmd >/dev/null

echo "ctrl+c to stop"
parec -d "$MONITOR" | sox -t raw -r 44k -sLb 16 -c 2 - "$WAV"
