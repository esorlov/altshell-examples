#!/bin/sh
echo "Список всех пользователей:"
OIFS=$IFS; IFS=:       # В файле /etc/passwd, в качестве разделителя полей
                       # используется символ ":" .
while read name passwd uid gid fullname ignore
do
  echo "$name ($fullname)" 
done </etc/passwd      # перенаправление ввода.
IFS=$OIFS              # Восстановление предыдущего состояния переменной $IFS.
