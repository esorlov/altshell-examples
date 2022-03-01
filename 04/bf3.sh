#!/bin/sh

retstr=""

function help_and_exit() {
	echo "Usage: `basename $0`  <dir> . . ."
	exit 1
}


function make_backup() {
	#exec > /dev/null
	#exec 2>&1
	TAR_CMD="tar -cJf"
	BACKUP_DIR=$1
	BACKUP_FILE_TMPL=backup-$(date +%Y-%m-%d_%H:%M)
	F_NAME=$HOME/$BACKUP_FILE_TMPL-$(basename $BACKUP_DIR).tar.xz
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
	while (( "$#" )); do
		B_DIR=$1
		if [ -d $B_DIR ]; then 
			make_backup $B_DIR
			[ $? -ne 0 ] && echo $retstr
		else
			echo "ERR: Directory $B_DIR doesnot exists"
		fi
		shift
	done
}

main $*
