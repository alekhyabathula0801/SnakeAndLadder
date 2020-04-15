#!/bin/bash -x
#constants
MOVE_FORWARD=1
MOVE_BACKWARD=2
NO_PLAY=0
NUMBER_OF_PLAYERS=1
GOAL=100
START_POSITION=0
#variable
numOfRolls=0

position[$numOfRolls]=$START_POSITION
while [ ${position[$numOfRolls]} -lt $GOAL ]
do
	prevRoll=$numOfRolls
	numOfRolls=$(($numOfRolls+1))
	dieNumber=$((RANDOM%6+1))
	random=$((RANDOM%3))
	case $random in
		$MOVE_FORWARD)
			position[$numOfRolls]=$((${position[$prevRoll]}+$dieNumber))
                        if [ ${position[$numOfRolls]} -gt $GOAL ]
                        then
                                position[$numOfRolls]=${position[$prevRoll]}
                        fi
		;;
        	$MOVE_BACKWARD)
                	position[$numOfRolls]=$((${position[$prevRoll]}-$dieNumber))
        		if [ ${position[$numOfRolls]} -lt $START_POSITION ]
			then
				position[$numOfRolls]=$START_POSITION
			fi
		;;
		*)
			position[$numOfRolls]=${position[$prevRoll]}
		;;
	esac
done
echo Total number of die rolls = $numOfRolls
echo For die roll numbers ${!position[@]} positions are ${position[@]} respectively
