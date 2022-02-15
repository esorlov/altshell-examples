#!/bin/sh
# Скрипт отображает размер файлов или каталогов передаваемых в качестве параметров
PARAMNUM=$#
while (( "$#" )); do
	if [ -d $1 ]; then
		echo $(du -sh $1 2> /dev/null) "- каталог"
	else
		echo $(ls -sh $1 2> /dev/null) "- файл"
	fi
	shift
done
echo "Всего обработано" $PARAMNUM "параметра(ов)"
