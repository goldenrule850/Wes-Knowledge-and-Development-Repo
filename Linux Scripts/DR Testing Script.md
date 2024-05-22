
### For the General Linux Version:
```bash
#!/bin/bash

# Get the hostname
HOSTNAME=$(hostname)

# Get the current time and date
DATE=$(date +"%m-%d-%Y %T")

# Get a list of critical errors from the last 30 minutes
ERRORS=$(grep "critical" /var/log/messages -B1 -A1 --since=-30m)

# Check if there were any critical errors
if [ -z "$ERRORS" ]; then
  ERRORS="No errors found in the last 30 minutes"
fi

# Get a list of actively running services with sudo
SERVICES=$(sudo systemctl list-units --type=service --state=running)

# Output the results in a table
echo -e "Hostname: $HOSTNAME\nTime and Date of Test: $DATE\nCritical Errors: $ERRORS\nRunning Services:\n$SERVICES"
```

### For the Amazon Linux Version:

```bash
#!/bin/bash

# Get the hostname
HOSTNAME=$(hostname)

# Get the current time and date
DATE=$(date +"%m-%d-%Y %T")

# Get a list of critical errors from the last 30 minutes
ERRORS=$(grep "critical" /var/log/messages -B1 -A1 --since=-30m)

# Check if there were any critical errors
if [ -z "$ERRORS" ]; then
  ERRORS="No errors found in the last 30 minutes"
fi

# Get a list of actively running services with sudo
# This is for Amazon Linux where systemctl may be used instead of chkconfig
SERVICES=$(sudo systemctl list-units --type=service --state=running)

# Output the results in a table
echo -e "Hostname: $HOSTNAME\nTime and Date of Test: $DATE\nCritical Errors: $ERRORS\nRunning Services:\n$SERVICES"
```

