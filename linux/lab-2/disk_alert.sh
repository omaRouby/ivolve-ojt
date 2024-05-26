#!/bin/bash

# Set the threshold percentage
THRESHOLD=5

# Get the current disk usage percentage for the root filesystem
USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')

# Check if the current usage exceeds the threshold
if [ "$USAGE" -gt "$THRESHOLD" ]; then
    # Create the email content
    echo -e "To: omar.rouby2000@gmail.com\nFrom: roby.omar16@gmail.com\nSubject: Disk Space Alert\n\nThe root filesystem usage is at ${USAGE}% which exceeds the threshold of ${THRESHOLD}%." > /tmp/disk_alert.txt

    # Send the email using msmtp
    msmtp --debug --from=default -t < /tmp/disk_alert.txt
fi
