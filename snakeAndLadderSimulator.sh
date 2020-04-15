#!/bin/bash -x
#constants
MOVE_FORWARD=1
MOVE_BACKWARD=2
NO_PLAY=0
NUMBER_OF_PLAYERS=1
#variables
position=0
dieNumber=$((RANDOM%6+1))
random=$((RANDOM%3))
case $random in
	$MOVE_FORWARD)
		position=$(($position+$dieNumber))
	;;
        $MOVE_BACKWARD)
                position=$(($position-$dieNumber))
        ;;
        $NO_PLAY)
                position=$(($position+0))
        ;;
esac
