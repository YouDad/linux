#!/bin/bash

# 外接屏
PRIName=DP1
PRIMode=1920x1080
PRIPos=0x0
PRIRate=144

# 内置屏 15.6'
SECName=eDP1
SECMode=1920x1080
SECPos=0x0
SECRate=60

xrandr \
	--output HDMI1 --off \
	--output HDMI2 --off \
	--output VIRTUAL1 --off \
	--output $PRIName --mode $PRIMode --pos $PRIPos --rate $PRIRate --primary \
	--output $SECName --mode $SECMode --pos $SECPos --rate $SECRate
