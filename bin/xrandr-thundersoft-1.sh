#!/bin/bash

# 内置屏 15.6'
PRIName=DP3
PRIMode=1920x1080
PRIPos=1920x0
PRIRate=60

xrandr \
	--output $PRIName --mode $PRIMode --pos $PRIPos --rate $PRIRate --primary \
