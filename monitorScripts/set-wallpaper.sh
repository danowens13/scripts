#!/bin/bash
# A script to toggle the orientation of my secondary monitor. Will maintain the state of the mini monitor

source monitor-configuration

nitrogen --set-scaled --head=$primMonIndex ${wallpaperDir}prim.png
if [ $(xrandr --prop | grep $secMon | cut -d ' ' -f 3) != "(normal" ]; then
	if [ $(xrandr --prop | grep $secMon | cut -d ' ' -f 4) = "left" ]; then
		nitrogen --set-scaled --head=$secMonIndex ${wallpaperDir}sec.png
	else
		nitrogen --set-scaled --head=$secMonIndex ${wallpaperDir}prim.png
	fi
fi
if [ $(xrandr --prop | grep $miniMon | cut -d ' ' -f 3) != "(normal" ]; then
	nitrogen --set-scaled --head=$miniMonIndex ${wallpaperDir}mini.png
fi
