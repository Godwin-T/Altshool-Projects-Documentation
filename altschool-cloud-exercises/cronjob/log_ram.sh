#!/bin/bash

# Set the log file and email address
LOG_FILE="/path/to/ramdetails.txt"
EMAIL=""

# Get current hour (00 to 23)
HOUR=$(date +"%H")

# Log current memory usage with timestamp
{
    echo "=== RAM Usage at $(date '+%Y-%m-%d %H:%M:%S') ==="
    free -h
    echo ""
} >> "$LOG_FILE"

# If it's midnight (hour == 00), send email and clear log
if [ "$HOUR" -eq 0 ]; then
    # Email the file content
    mail -s "Daily RAM Usage Report" "$EMAIL" < "$LOG_FILE"

    # Clear the file for a new day
    > "$LOG_FILE"
fi

