#!/bin/bash

arg1=$1
arg2=$2
res=("best" "worst" "720p60_alt" "936p60" "160p" "360p" "480p" "720p" "720p60" "1080p" "1080p60")
isValidRes=false

# Exit script if first string argument string is empty
if [ -z ${arg1} ]; then
	echo "Needs both arguments"
	exit 1
fi

# Default to 360p if second string argument is empty
if [ -z ${arg2} ]; then
	arg2="360p"
fi

# Check if second argument is a valid video resolution
for r in ${res[@]}; do
	if [ ${arg2} == $r ]; then
		isValidRes=true
		break
	fi
done

# Exit if second argument is an invalid video resolution
if [ "${isValidRes}" = false ]; then
	echo "Invalid video resolution provided in second argument"
	exit 1
fi

streamlink --twitch-disable-ads --stdout https://www.twitch.tv/$1 $2 | /Applications/IINA.app/Contents/MacOS/IINA --stdin
# $(streamlink --stdout https://www.twitch.tv/${arg1} ${arg2} | /Applications/IINA.app/Contents/MacOS/IINA --stdin)
