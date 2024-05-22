The script will utilize the `lookup-events` command to search through your CloudTrail logs for events related to IAM access key creation.

The event name for creating an IAM access key is `CreateAccessKey`. You can use this in the `--lookup-attributes` parameter to filter the events.

```bash
#!/bin/bash

# Calculate the start time as 30 days before the current date in UTC
start_time=$(date -u --date='30 days ago' +"%Y-%m-%dT%H:%M:%SZ")
# Use the current time as the end time
end_time=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

# Automatically use the region that CloudShell is running in
region=$AWS_DEFAULT_REGION

# Lookup CloudTrail events for creating IAM access keys
aws cloudtrail lookup-events \
    --lookup-attributes AttributeKey=EventName,AttributeValue=CreateAccessKey \
    --start-time "$start_time" \
    --end-time "$end_time" \
    --region "$region"
```


