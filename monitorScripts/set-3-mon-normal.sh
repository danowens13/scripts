#!/bin/bash

source monitor-configuration

primXrandr="--output $primMon --primary --mode 2560x1440 --pos 1920x0 --rotate normal --rate 144 --set TearFree on"
secXrandr="--output $secMon --mode 1920x1080 --pos 0x180 --rotate normal --rate 144 --set TearFree on" 
miniXrandr="--output $miniMon --mode 1280x720 --pos 4480x1386 --rotate normal --set TearFree off"

xrandr $primXrandr $secXrandr $miniXrandr
sleep .5
set-wallpaper
