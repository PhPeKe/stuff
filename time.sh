#!/bin/bash
#bash check.sh & stdbuf -oL python start.py | tee output.txt
while true
do
	#clear
	sleep 1m
	echo "-----------------------------------------------checking..."
	grep "Manager has exited with status code 1" output.txt #&> /dev/null
	if [ $? == 0 ] 
	then
		echo "-----------------------------------------------ERROR FOUND!"
		echo "THERE WAS AN ERROR" > elog.txt
		bash kill.sh
		rm output.txt
		echo "Restarting..."
		bash start.sh&
		echo "Restarted!"
		kill $$
		break
	else
		echo "-----------------------------------------------NO ERROR FOUND"
	fi
done
