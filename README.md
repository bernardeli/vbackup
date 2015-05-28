# Docker Volume Files Backup to S3

## How to use

```
docker build -t vbackup:latest .
```

```
docker run -it \
  -e AWS_ACCESS_KEY_ID=your-aws-key-id \
  -e AWS_SECRET_ACCESS_KEY=your-aws-secret-access-key \
  -e AWS_BACKUP_BUCKET=your-bucket \
  -e DIRECTORY_TARGET=/foo \
  -e SLEEP_TIME=10 \
  -v /foo:/foo
  --name vbackup \
  vbackup:latest
```


