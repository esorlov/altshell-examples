#!/bin/sh

TAR_CMD="tar -cJf"
SUFFIX="tar.xz"
BACKUPS=$HOME
PREFIX="backup"
DATEFMT="%Y-%m-%d_%H:%M"

retstr=""

function help_and_exit() {
	echo "Usage: `basename $0`  <dir> . . ."
	exit 1
}

function make_backup() {
	local BACKUP_DIR=$1
	local F_NAME=$BACKUPS/$PREFIX-$(date +$DATEFMT)-$(basename $BACKUP_DIR).$SUFFIX
	if [ -f $F_NAME ]; then
		retstr="ERR: $F_NAME already exist"
		return -1
	else
		$TAR_CMD $F_NAME $BACKUP_DIR &> /dev/null
		retstr="OK: $F_NAME created"
		return 0
	fi
}

function main() {
	if [ "$1" == "" ]; then
		help_and_exit
	fi
	echo "Making backups to $BACKUPS"
	while (( "$#" )); do
		local B_DIR=$1
		if [ -d $B_DIR ]; then 
			make_backup $B_DIR || echo $retstr
		else
			echo "ERR: Directory $B_DIR doesn\'t exists"
		fi
		shift
	done
}

main $*
