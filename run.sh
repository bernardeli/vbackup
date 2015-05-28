#!/bin/bash

AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID:?"AWS_ACCESS_KEY_ID required"}
AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY:?"AWS_SECRET_ACCESS_KEY required"}
AWS_BACKUP_BUCKET=${AWS_BACKUP_BUCKET:?"AWS_BACKUP_BUCKET required"}
DIRECTORY_TARGET=${DIRECTORY_TARGET:?"DIRECTORY_TARGET required"}
SLEEP_TIME=${SLEEP_TIME:-300} # 300 seconds / 5 minutes

backup() {
  while true
  do
    echo "[$(date)] Backing up"
    aws s3 sync $DIRECTORY_TARGET s3://$AWS_BACKUP_BUCKET

    echo "[$(date)] Going to sleep..."
    sleep $SLEEP_TIME
  done
}

restore() {
  echo "[$(date)] Restoring"
  aws s3 sync s3://$AWS_BACKUP_BUCKET $DIRECTORY_TARGET
}

command=$1
case "$command" in
  backup)
    backup
    ;;
  restore)
    restore
    ;;
  *)
    echo "Do not recognise command. Use backup|restore"
    RETVAL=1
esac
exit $RETVAL
