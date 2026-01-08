#!/bin/bash
#A script to toggle if my third mini monitor is active. Maintains the current orientation of the secondary monitor

source monitor-configuration

if [ $(xrandr --prop | grep $miniMon | cut -d ' ' -f 3) = "(normal" ]; then
		set-3-mon-left
else
		set-1-mon
fi
