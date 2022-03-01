#!/bin/sh

TAR_CMD="tar -cJf"
BACKUPS=$HOME
PREFIX="b"
DATEFMT="%Y-%m-%d_%H:%M"


function help_and_exit() {
	echo "Usage: `basename $0`  <dir> . . ."
	exit 1
}

function main() {
	if [ "$1" == "" ]; then
		help_and_exit
	fi
	echo "Making backups to $BACKUPS"
	while (( "$#" )); do
		B_DIR=$1
		if [ -d $B_DIR ]; then 
			make_backup $B_DIR || echo $retstr
		else
			echo "ERR: Directory $B_DIR doesn\'t exists"
		fi
		shift
	done
}

. ./backup-func
main $*
