#!/bin/bash
# dunstBright

msgId="3378455"

brightnessctl "$@" > /dev/null

brightnow="$(brightnessctl g)"
brightmax="$(brightnessctl m)"

brightpercent=$(awk "BEGIN {print ${brightnow}/${brightmax}*100}")

dunstify -a "changeBrightness" -u low -r "$msgId" \
	-h int:value:"$brightpercent" "Brightness: ${brightpercent}%"
