#!/bin/bash

# 内置屏 15.6'
PRIName=eDP1
PRIMode=1920x1080
PRIPos=1920x0
PRIRate=60

xrandr \
	--output HDMI1 --off \
	--output HDMI2 --off \
	--output VIRTUAL1 --off \
	--output DP1 --off \
	--output $PRIName --mode $PRIMode --pos $PRIPos --rate $PRIRate --primary \
