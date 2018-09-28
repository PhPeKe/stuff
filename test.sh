#!/bin/bash
# P. Kersten
# Catch error in input from start.py

# Prerequirements: xdotools
# Check for xdotool
echo "checking for xdotool"
dpkg -s xdotool &> /dev/null
if [ $? == 0 ]
then
	echo "xdotool installed"
	grep -q 'Manager has exited with status code 1, restarting experiment...' &> /dev/null
	if [ $? == 0 ] 
	then
	   echo "restarting experiment..."
	   xdotool keydown ctrl
	   xdotool key d
	   xdotool keyup ctrl
	   python start.py
	   echo "restarted experiment"
	fi
else
    echo "try: sudo apt install xdotool"
fi

