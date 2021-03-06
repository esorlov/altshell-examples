#!/bin/sh

TAR_CMD="tar -cJf"

function help_and_exit {
	echo "Usage: `basename $0`  <dir> ..."
	exit 1
}

if [ "$1" != "" ]; then
	while (( "$#" )); do
		BACKUP_DIR=$1
		BACKUP_FILE_TMPL=backup-$(date +%Y-%m-%d_%H:%M)
		F_NAME=$BACKUP_FILE_TMPL-$(basename $1).tar.xz
		$TAR_CMD $HOME/$F_NAME $BACKUP_DIR
		shift
	done
else
	help_and_exit
fi
