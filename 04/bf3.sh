#!/bin/sh

function help_and_exit() {
	echo "Usage: `basename $0`  <dir> . . ."
	exit 1
}


function make_backup() {
	exec > /dev/null
	exec 2>&1
	TAR_CMD="tar -cJf"
	BACKUP_DIR=$1
	BACKUP_FILE_TMPL=backup-$(date +%Y-%m-%d_%H:%M)
	F_NAME=$HOME/$BACKUP_FILE_TMPL-$(echo $BACKUP_DIR | tr '/' '-').tar.xz
	if [ -f $F_NAME]; then
		return "ERR: $F_NAME already exist"
	else
		$TAR_CMD $F_NAME $BACKUP_DIR
		return "OK: $F_NAME created"
	fi
}

function main() {
	if [ "$1" == "" ]; then
		help_and_exit
	fi
	while (( "$#" )); do
		B_DIR=$1
		if [ -d $B_DIR ]; then 
			ret=$(make_backup $B_DIR)
			echo $ret
		else
			echo "ERR: Directory $B_DIR doesn\'t exists"
		fi
		shift
	done
}

main $*
