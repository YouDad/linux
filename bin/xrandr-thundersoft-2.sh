#!/bin/bash

PRIName=DP3
PRIMode=1920x1080
PRIPos=0x0
PRIRate=60

SECName=DP1-8
SECMode=1920x1080
SECPos=1920x0
SECRate=60

xrandr \
	--output $PRIName --mode $PRIMode --pos $PRIPos --rate $PRIRate \
	--output $SECName --mode $SECMode --pos $SECPos --rate $SECRate --primary

xrandr \
	--output $PRIName --mode $PRIMode --pos $PRIPos --rate $PRIRate --primary \
	--output $SECName --mode $SECMode --pos $SECPos --rate $SECRate
