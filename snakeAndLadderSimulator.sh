#!/bin/bash -x
#constants
MOVE_FORWARD=1
MOVE_BACKWARD=2
NO_PLAY=0
NUMBER_OF_PLAYERS=1
GOAL=100
START_POSITION=0

position=$START_POSITION
while [ $position -lt $GOAL ]
do
	dieNumber=$((RANDOM%6+1))
	random=$((RANDOM%3))
	case $random in
		$MOVE_FORWARD)
			position=$(($position+$dieNumber))
		;;
        	$MOVE_BACKWARD)
                	position=$(($position-$dieNumber))
        		if [ $position -lt $START_POSITION ]
			then
				position=$START_POSITION
			fi
		;;
	esac
done
