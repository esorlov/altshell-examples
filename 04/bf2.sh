#!/bin/sh

function help_and_exit() {
	echo "Usage: `basename $0`  <dir> . . ."
	exit 1
}


function make_backup() {
	TAR_CMD="tar -cJf"
	BACKUP_DIR=$1
	BACKUP_FILE_TMPL=backup-$(date +%Y-%m-%d_%H:%M)
	F_NAME=$BACKUP_FILE_TMPL-$(basename $BACKUP_DIR).tar.xz
	$TAR_CMD $HOME/$F_NAME $BACKUP_DIR
}

function main() {
	if [ "$1" == "" ]; then
		help_and_exit
	fi
	while (( "$#" )); do
		B_DIR=$1
		[ -d $B_DIR ] && make_backup $B_DIR
		shift
	done
}

main $*
