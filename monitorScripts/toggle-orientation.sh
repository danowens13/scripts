#!/bin/bash
# A script to toggle the orientation of my secondary monitor. Will maintain the state of the mini monitor

source monitor-configuration

if [ $(xrandr --prop | grep $secMon | cut -d ' ' -f 3) != "(normal" ]; then
	if [ $(xrandr --prop | grep $secMon | cut -d ' ' -f 4) = "left" ]; then
		set-3-mon-normal
	else
		set-3-mon-left
	fi
fi
