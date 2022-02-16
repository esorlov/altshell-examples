#!/bin/sh
PATHSTR=$(echo $PATH | sed 's/:/ /g')
NUM=0
for bindir in $PATHSTR; do
	if [ ! -d $bindir ]; then
		continue
	fi
	filelist=$(ls $bindir)
	for binfile in $filelist; do
		if [ -x $bindir/$binfile ]; then
			let NUM++
		fi
	done
	printf "%d\tисполняемых файлов в %s.\n" $NUM $bindir
	NUM=0
done
