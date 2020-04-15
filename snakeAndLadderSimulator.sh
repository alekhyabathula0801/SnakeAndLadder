#!/bin/bash -x
#constants
MOVE_FORWARD=1
MOVE_BACKWARD=2
NO_PLAY=0
NUMBER_OF_PLAYERS=2
GOAL=100
START_POSITION=0
#variable
playNextTurn=yes
declare -A position

for (( player=1; player<=$NUMBER_OF_PLAYERS; player++ ))
do
	position[$player]=$START_POSITION
done

function findPosition(){
	for (( player=1; player<=$NUMBER_OF_PLAYERS; player++ ))
        do
		dieNumber=$((RANDOM%6+1))
		random=$((RANDOM%3))
		case $random in
			$MOVE_FORWARD)
				position[$player]=$((${position[$player]}+$dieNumber))
                        	if [ ${position[$player]} -gt $GOAL ]
                        	then
                                	position[$player]=$((${position[$player]}-$dieNumber))
                        	fi
			;;
        		$MOVE_BACKWARD)
                		position[$player]=$((${position[$player]}-$dieNumber))
        			if [ ${position[$player]} -lt $START_POSITION ]
				then
					position[$player]=$START_POSITION
				fi
			;;
		esac
	done
}

while [ $playNextTurn = yes ]
do
	#calling function to find position of players
	findPosition
	for (( player=1; player<=$NUMBER_OF_PLAYERS; player++ ))
	do
		if [ ${position[$player]} -eq $GOAL ]
		then
			winner=$player
			playNextTurn=no
		fi
	done
done
echo winner is $winner
