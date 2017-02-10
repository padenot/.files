#!/bin/sh

id=$(xinput | grep -i "TouchPad" | sed 's/.*id=\([[:digit:]]\+\).*/\1/')
xinput set-prop $id "Device Enabled" 0
xinput > ~/log
