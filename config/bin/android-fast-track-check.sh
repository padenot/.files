#!/bin/bash -e

# list all tabs
PID=$(adb shell ps | grep "mozilla.geckoview_example:tab" | tr -s ' ' | cut -d ' ' -f 2)
echo "PID of tab playing audio:"
echo $PID
adb shell dumpsys media.audio_flinger | grep -C 8 $PID

# look for lines like this:
#    T Name Active Client Session S  Flags   Format Chn mask  SRate ST  L dB  R dB  VS dB   Server FrmCnt  FrmRdy F Underruns  Flushed Main Buf  Aux Buf
#         1     no  23568    3913 P  0x400 00000001 00000003  44100  3     0     0     0  0017EDC4   1772     890 A       886        0 F153E000 00000000
#    ^ this is not blank, and says F when the track is fastmixer
