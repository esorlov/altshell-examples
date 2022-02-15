#!/bin/sh
# Cкрипт для резервного копирования.
DATE=$(date -I)
FILE_NAME="/tmp/home-$USER-$DATE.tar.gz"
BACKUP_DIR=$HOME
LOG_FILE="/tmp/backup.log"
echo $DATE "Произвожу резервное копирование..." >> "$LOG_FILE"
tar -zcpf "$FILE_NAME" "$BACKUP_DIR" >> "$LOG_FILE" 2>&1 || echo "Ошибка (статус: $?)" >> "$LOG_FILE"
echo "Резервное копирование завершено  (статус: $?)" \
        >> "$LOG_FILE"
