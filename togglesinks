#!/bin/bash

HEADPHONES=$(pacmd list-sinks | grep -B1 'name: <alsa_output.usb-Logitech_G533_Gaming_Headset-00.analog-stereo>' | sed '2D' | cut -c12)
SPEAKERS=$(pacmd list-sinks | grep -B1 'name: <alsa_output.pci-0000_0e_00.4.analog-stereo>' | sed '2D' | cut -c12)
SWAP=$(pacmd list-sinks | grep '\* index' | cut -c12)
if [ $SPEAKERS == $SWAP ]; then
    SINK=$HEADPHONES
else
    SINK=$SPEAKERS
fi
pacmd set-default-sink ${SINK}
pacmd list-sink-inputs | grep index | while read line
do
	pacmd move-sink-input `echo $line | cut -f2 -d' '` ${SINK}
done
