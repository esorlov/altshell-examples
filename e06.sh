#!/usr/bin/env bash

COMMAND="$1"
POS_X=0
POS_Y=0
echo "Welcome to the game!  Choose your action:"
while true; do
    read -p "> " COMMAND
    case $COMMAND in
        "a")
            let POS_X--
            ;;
        "d")
            let POS_X++
            ;;
        "w")
            let POS_Y--
            ;;
        "v")
            echo "You're on position: ${POS_X}, ${POS_Y}"
            ;;
        "x")
            exit 0;
            ;;
        *)
            echo "Unknown command."
            ;;
    esac
done
