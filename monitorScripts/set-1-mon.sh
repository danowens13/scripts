#!/bin/bash

source monitor-configuration

primXrandr="--output $primMon --primary --mode 2560x1440 --pos 1080x172 --rotate normal --rate 144 --set TearFree on"
secXrandr="--output $secMon --off" 
miniXrandr="--output $miniMon --off"

xrandr $primXrandr $secXrandr $miniXrandr
sleep .5
set-wallpaper
