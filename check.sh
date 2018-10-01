#!/bin/bash
#bash check.sh & stdbuf -oL python start.py | tee output.txt
while true
do
	#clear
	sleep 1m
	echo "check:------------------------------------------checking..."
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
		kill -9 $$
		break
	else
		echo "check:------------------------------------------NO ERROR FOUND" >output.txt
		sleep 1m
	fi
	tail -1 output.txt | grep "check:" #&> /dev/null
	if [ $? == 0 ] 
	then
		echo "-----------------------------------------------TIMED OUT!"
		echo "THERE WAS AN ERROR" > elog.txt
		bash kill.sh
		rm output.txt
		echo "Restarting..."
		bash start.sh&
		echo "Restarted!"
		kill -9 $$
		break
	fi
done
