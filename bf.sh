#!/bin/sh
TAR_CMD="tar -cJf"
if [ "$1" != "" ]; then
	while (( "$#" )); do
		BACKUP_DIR=$1
		BACKUP_FILE_TMPL=backup-$(date +%Y-%m-%d_%H:%M)
		F_NAME=$BACKUP_FILE_TMPL-$(echo $1 | tr '/' '-').tar.xz
		$TAR_CMD $HOME/$F_NAME $BACKUP_DIR
		shift
	done
else
	echo "Usage: " $0 " <dir>"
fi
