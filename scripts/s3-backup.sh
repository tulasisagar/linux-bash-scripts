#!/bin/bash
echo "============================================"
echo "script : s3-backup.sh"
echo "User: $(whoami)"
echo "Purpose : Backup local folder to AWS S3"
echo "============================================="
BACKUP_FOLDER=~/linux-bash-scripts/scripts
BACKUP_DIR=~/backups
BUCKET_NAME="tulasi-devops-backup"
DATE=$(date +%y-%m-%d_%h%m%s)

BACKUP_FILE="backup-$DATE.tar.gz"
LOG_FILE=~/backups/backup.log
echo " "
echo "=============================================="
echo "     S3 Backup Automation Project"
echo "=============================================="
echo " "
echo "date : $(date)"

echo "checking up backup folder"

if [ -d $BACKUP_FOLDER ]
then
   echo "find folder : $BACKUP_FOLDER"
else 
   echo "ERROR: Folder not found"
exit 1
fi

mkdir -p "$BACKUP_DIR"

echo "creating backup archive....."
tar -czf "$BACKUP_DIR/$BACKUP_FILE" "$BACKUP_FOLDER"

if [ $? -ne 0 ]
then
   echo "ERROE: backup creation failed"
   exit 1
fi

echo "backup created...."
echo "$BACKUP_DIR/$BACKUP_FILE"

echo "uploading backup to S3..."

aws s3 cp "$BACKUP_DIR/$BACKUP_FILE" s3://$BUCKET_NAME/

if [ $? -eq 0 ]
then 
    echo "$(date)- backup success - $BACKUP_FILE" >> "$LOG_FILE"
    echo "Uploaded Successfully"
else
    echo "$(date)- backup failed - $BACKUP_FILE" >> "$LOG_FILE"
    echo "uploading fail"
    exit 1
fi

find "$BACKUP_DIR" -name "*.tar.gz" -mtime +7 -delete

echo " "
echo "Old backups cleaned"

echo "=========================================="
echo "    BACKUP COMPLETED"
echo "=========================================="

