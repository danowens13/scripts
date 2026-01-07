#!/bin/bash
#A script to toggle if my third mini monitor is active. Maintains the current orientation of the secondary monitor

source MonitorConfiguration

if [ $(xrandr --prop | grep $miniMon | cut -d ' ' -f 3) = "(normal" ]; then
	if [ $(xrandr --prop | grep $secMon | cut -d ' ' -f 4) = "left" ]; then
		set-3-mon-Left
	else
		set-3-mon-normal
	fi
else
	if [ $(xrandr --prop | grep $secMon | cut -d ' ' -f 4) = "left" ]; then
		set-2-mon-left
	else
		set-2-mon-normal
	fi
fi
