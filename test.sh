#!/bin/bash
# P. Kersten
# Catch error in input from start.py

# Prerequirements: xdotools
# Check for xdotool
echo "Checking for xdotool"
dpkg -s xdotool &> /dev/null
if [ $? == 0 ]
then
	echo "xdotool installed..."
	grep -q '1' &> /dev/null
	if [ $? == 0 ] 
	then
	   echo "Found it"
	   xdotool keydown ctrl
	   xdotool key d
	   xdotool keyup ctrl
	   python test2.py
	fi
else
    echo "run: sudo apt install xdotool"
fi

