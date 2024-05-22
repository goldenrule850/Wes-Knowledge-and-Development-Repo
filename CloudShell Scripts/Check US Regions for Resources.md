### S3, EC2, ELBs, RDS, WorkSpaces
```bash
#!/bin/bash

# Define the list of US regions
us_regions=("us-east-1" "us-east-2" "us-west-1" "us-west-2")
workspace_regions=("us-east-1" "us-west-2")

# S3 Buckets count (Global)
s3_count=$(aws s3 ls | wc -l)

# Initialize counts
workspaces_count=0
ec2_count=0
load_balancers_count=0
rds_count=0

# Loop through each workspace region to count WorkSpaces resources
for region in "${workspace_regions[@]}"; do
    echo "Checking for WorkSpace resources in US region: $region"
        
    # WorkSpaces count
    region_workspaces_count=$(aws workspaces describe-workspaces --region "$region" --query 'Workspaces[*].WorkspaceId' | jq -r '. | length')
    workspaces_count=$((workspaces_count + region_workspaces_count))
done # <-- This ends the WorkSpaces count loop

# Loop through each US region to count other resources
for region in "${us_regions[@]}"; do
    echo "Checking resources in US region: $region"
    
    # EC2 Instances count
    region_ec2_count=$(aws ec2 describe-instances --region "$region" --query 'Reservations[*].Instances[?State.Name==`running` || State.Name==`stopped`].InstanceId' | jq -r '.[] | length' | jq -s 'add')
    ec2_count=$((ec2_count + region_ec2_count))
    
    # Load Balancers count
    region_load_balancers_count=$(aws elbv2 describe-load-balancers --region "$region" --query 'LoadBalancers[*].LoadBalancerArn' | jq -r '. | length')
    load_balancers_count=$((load_balancers_count + region_load_balancers_count))
    
    # RDS Instances count
    region_rds_count=$(aws rds describe-db-instances --region "$region" --query 'DBInstances[*].DBInstanceIdentifier' | jq -r '. | length')
    rds_count=$((rds_count + region_rds_count))
done

# Output the counts
echo "Total S3 Buckets count in US regions: $s3_count"
echo "Total WorkSpaces count in US regions: $workspaces_count"
echo "Total EC2 Instances count in US regions: $ec2_count"
echo "Total Load Balancers count in US regions: $load_balancers_count"
echo "Total RDS Instances count in US regions: $rds_count"
```

