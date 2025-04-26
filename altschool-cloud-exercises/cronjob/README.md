# 🧾 Hourly RAM Usage Logger with Daily Email Report

## 📌 Overview

This project automates the process of:

- Logging system memory (RAM) usage every hour using `free -h`
- Sending a daily email report of the logged data at midnight
- Clearing the log file after sending the report

The automation is handled using **cron jobs**, a bash script, and `mailutils`.

---

## 🕒 What is a Cron Job?

A **cron job** is a time-based job scheduler in Unix-like systems. It allows users to schedule scripts or commands to run automatically at specified times or intervals.

### What is `crontab`?

- `crontab` (short for **cron table**) is a file that contains a list of cron jobs.
- Each line in the crontab represents a scheduled task with a specific time format.

### Crontab Time Format:

[!crontable](./assets/crontable.png)


---

## 🛠️ Tools & Commands Used

### `free -h`

- Displays the system’s RAM usage in a human-readable format.
- Used to log memory usage every hour.

### `mailutils`

- A package that provides the `mail` command for sending emails from the terminal.
- Make sure it's installed with:

```bash
sudo apt install mailutils
```
### Script: log_ram.sh
The script:
- Appends ram usage to a file every hour
- Sends the content of the file via email at midnight
- Clears the file after sending

```bash
#!/bin/bash

LOG_FILE="/path/to/ramdetails.txt"
EMAIL="youremail@example.com"
HOUR=$(date +"%H")

{
    echo "=== RAM Usage at $(date '+%Y-%m-%d %H:%M:%S') ==="
    free -h
    echo ""
} >> "$LOG_FILE"

if [ "$HOUR" -eq 0 ]; then
    mail -s "Daily RAM Usage Report" "$EMAIL" < "$LOG_FILE"
    > "$LOG_FILE"
fi

```

### Cron Job Setup

To run the script every hour, edit your crontab:

```bash
crontab -e
```

Add this line

```bash
0 * * * * /bin/bash /full/path/to/log_ram.sh
```

### Notes
-Ensure your system is configured to send emails from the command line.
