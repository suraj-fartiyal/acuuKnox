#!/bin/bash

# Variables
SOURCE_DIR="/path/to/source/directory"
DESTINATION_DIR="/path/to/destination/directory"
LOG_FILE="/path/to/backup_log.log"

# Perform the backup using rsync
rsync -av --delete $SOURCE_DIR $DESTINATION_DIR &>> $LOG_FILE

# Check if the backup was successful
if [ $? -eq 0 ]; then
    echo "Backup successful!" | tee -a $LOG_FILE
else
    echo "Backup failed!" | tee -a $LOG_FILE
fi
