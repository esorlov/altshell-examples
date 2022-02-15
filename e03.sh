#!/bin/sh
SCRIPT_NAME="$0"
USER_NAME="$1"
if [ -z "$USER_NAME" ]; then
    echo "Usage: $SCRIPT_NAME USER_NAME"
    exit 1
fi
echo "---------- LAST 10 SESSIONS ----------"
last -F "$USER_NAME" | head
echo "---------- TOP PROCESSES ----------"
PS_FORMAT="pid,%cpu,state,tname,time,comm"
ps -U "$USER_NAME" --sort=-%cpu -o "$PS_FORMAT" | head
echo "---------- HOME DIRECTORY SIZE ----------"
du -sh "/home/$USER_NAME" 2>/dev/null
exit 0
