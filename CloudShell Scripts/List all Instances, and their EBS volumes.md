### List all Instance types

```bash
#!/bin/bash

# Get the list of all instances
instances=$(aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId]' --output text)

echo "Listing all instances with their details and attached EBS volumes:"

# Iterate through all instances
for instance in $instances; do
    echo "----------------------------------------------------------------"
    echo "Instance ID: $instance"
    
    # Get instance details
    aws ec2 describe-instances --instance-ids $instance --query 'Reservations[*].Instances[*].[InstanceId,PrivateIpAddress,PublicIpAddress,InstanceType]' --output table
    
    # Get attached EBS volumes
    volumes=$(aws ec2 describe-volumes --filters Name=attachment.instance-id,Values=$instance --query 'Volumes[*].[VolumeId,Size,Iops,Throughput]' --output text)
    
    if [[ ! -z "$volumes" ]]; then
        echo "Attached EBS Volumes:"
        echo "VolumeID Size(IoPs) Throughput(MB/s)"
        # Print volume details
        while IFS= read -r volume; do
            echo "$volume"
        done <<< "$volumes"
    else
        echo "No EBS Volumes attached."
    fi
done
```

### List all m5 and t2 instances

```bash
#!/bin/bash

# Define a temporary file to hold instance details
temp_file=$(mktemp)

# Get details of all t2 and m5 instances including their Name tag
aws ec2 describe-instances \
    --query 'Reservations[*].Instances[*].[InstanceType,InstanceId,Tags[?Key==`Name`].Value|[0],PrivateIpAddress,PublicIpAddress]' \
    --filters "Name=instance-type,Values=t2.*,m5.*,m5a.*" \
    --output text > "$temp_file"

# Sort the instances first by instance type, then by Name tag
sort -k1,1 -k3,3 "$temp_file" > "${temp_file}_sorted"
mv "${temp_file}_sorted" "$temp_file"

echo "Instances sorted by type and name:"
current_type=""

# Read sorted instance details
while read -r instance_type instance_id name private_ip public_ip; do
    # Check if we are listing a new instance type to print the header
    if [ "$current_type" != "$instance_type" ]; then
        if [ ! -z "$current_type" ]; then
            echo ""
        fi
        echo "$instance_type series:"
        current_type=$instance_type
    fi

    # Print instance details
    echo "- Name: $name, ID: $instance_id, Private IP: $private_ip, Public IP: ${public_ip:-None}"

done < "$temp_file"

# Clean up
rm "$temp_file"

```

