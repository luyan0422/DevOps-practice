#!/usr/bin/bash

if [ $# -ne 1 ];then
	echo "Usage: $0 <log-directory>"
	exit 1
fi

TARGET_DIR=$1
ARCHIVE_DIR="$(pwd)/archive"
TIMES=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_NAME="logs_archive_${TIMES}.tar.gz"
LOG_FILE="archive_log.txt"

if [ ! -d "$TARGET_DIR" ];then
	echo "dir not exist"
	exit 1
fi

mkdir -p $ARCHIVE_DIR

tar -czf "${ARCHIVE_DIR}/${ARCHIVE_NAME}" -C "$TARGET_DIR" .

echo "$(date +"%Y-%m-%d %H:%M:%S") - Archived '${TARGET_DIR}' to '${ARCHIVE_DIR}/${ARCHIVE_NAME}'" >> $LOG_FILE

echo "Logs compressed successfully to '${ARCHIVE_DIR}/${ARCHIVE_NAME}'"



