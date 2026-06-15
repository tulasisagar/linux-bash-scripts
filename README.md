# Linux Automation & Bash Scripting Library

A collection of Bash automation scripts built on Linux (Ubuntu) to automate system monitoring, backups, user provisioning, and scheduled maintenance tasks.

## Features

* System health monitoring (CPU, Memory, Disk)
* Automated AWS S3 backups
* Linux user and group provisioning
* Scheduled execution using Cron jobs
* Logging and basic error handling

## ech Stack

* Bash
* Linux (Ubuntu / WSL)
* AWS CLI
* Amazon S3
* Cron
* Git & GitHub

## Project Structure

```text
linux-bash-scripts/
├── scripts/
│   ├── system-health.sh
│   ├── s3-backup.sh
│   └── user-management.sh
├── docs/
│   └── cron-jobs.txt
├── screenshots/
└── README.md
```

## Scripts

### system-health.sh

Monitors CPU, Memory, and Disk utilization and generates health reports.

### s3-backup.sh

Creates timestamped backups, uploads them to Amazon S3, and removes old backup files.

### user-management.sh

Automates Linux user creation, group creation, and user-group assignments with logging.

## Cron Automation

| Task                  | Schedule                 |
| --------------------- | ------------------------ |
| System Health Check   | Daily at 6:00 AM         |
| S3 Backup             | Every Sunday at 9:00 AM  |
| User Management Audit | First day of every month |

Cron configuration is available in:

```text
docs/cron-jobs.txt
```

## Key Learnings

* Bash scripting fundamentals
* Linux user and group administration
* File compression using tar
* AWS CLI and Amazon S3 integration
* Cron job scheduling
* Log management and troubleshooting

## Challenges & Fixes

| Challenge | Solution |
|-----------|----------|
| CPU showing 100% in script | `top -bn1` captures its own spike — fixed with `top -bn2 + tail -1` |
| Git clone failing | Folder already existed — removed with `rm -rf` and cloned fresh |
| Script not running | Fixed with `chmod +x` to make script executable |

## Author

Tulasi Muntimadugu

Aspiring DevOps Engineer building hands-on cloud and automation projects.
GitHub: https://github.com/tulasisagar
LinkedIn: https://linkedin.com/in/tulasi-sagar

```
```

