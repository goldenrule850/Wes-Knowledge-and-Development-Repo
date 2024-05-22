### EC2 Launch Troubleshooting

#### Error Explanation: `# InstanceLimitExceeded`

- **Cause of the Error**: This error message appears when an AWS user attempts to launch more virtual CPUs (vCPUs) than allowed by the current service quota for EC2 instances in a given region.
- **Purpose of vCPU Limits**: AWS enforces these service quotas to prevent the accidental over-provisioning of resources, which could lead to unexpected charges on the user's bill.

##### Understanding On-Demand Instance Limits

- **vCPU-Based Calculation**: The service quota for EC2 instances is based on the total number of vCPUs that are allocated across all On-Demand EC2 instances in a single region.
- **Instance Count vs. vCPU Count**: It's crucial to recognize that the limits are not imposed on the sheer number of instances but rather on the aggregate count of vCPUs associated with those instances.

##### Information on Default Service Quotas

- **Standard vCPU Quota**: By default, AWS accounts typically come with a service quota that allows for the provisioning of up to **64 vCPUs** for On-Demand instances across various instance families (such as A, C, D, H, I, M, R, T, Z) within a single AWS region.
- **Elastic Nature of Limits**: Note that these vCPU limits are flexible. AWS may increase these limits based on the user's operational patterns or upon a user's request for an increase.

##### Strategies for Resolution

- **Launching Instances in Alternate Regions**:
    - **Alternative Region Launch**: If the vCPU limit is reached in one region, users have the option to launch additional instances in a different region where the limit has not been exceeded.
    - **Potential Trade-offs**: Opting for a different region might affect network latency and incur additional data transfer costs. The availability of certain instance types may also vary by region.
- **Requesting an Increase in Service Quotas**:
    - **Increase Request**: Users can contact AWS support to request an increase in the vCPU service quota for the desired region.
    - **Justification Requirement**: AWS typically asks for a rationale behind the request, which might include the user's specific use case, growth projections, or the particular nature of their workload.

##### Additional Considerations for vCPU Service Quota Management

- **Usage Monitoring**: Users should actively monitor their current and projected vCPU usage to identify when it may be necessary to request a service quota increase.
- **Cost Implications**: Understand how service quota increases and the deployment of additional or larger instances may impact the overall cost structure.
- **Resource Right-sizing**: Regularly evaluate the sizing of deployed instances to ensure they are optimized for the workloads they support, avoiding both under and over-provisioning.
- **Utilization of Auto Scaling**: Implement Auto Scaling to effectively manage the scaling of instances, adhering to set vCPU limits.
- **Investment in Reserved Instances and Savings Plans**: For consistent and predictable workloads, purchasing Reserved Instances or committing to Savings Plans may result in an automatic increase in service quotas due to the demonstrated commitment to AWS services.

#### Error Explanation: `# InsufficientInstanceCapacity`

- **Cause of the Error**: This error message signals that the AWS service cannot fulfill the request for launching an EC2 instance due to a lack of available On-Demand capacity in the specified Availability Zone (AZ).
- **Underlying Issue**: The specific AZ where the instance launch was attempted doesn't have enough free capacity of the requested instance type. This could be due to high demand for resources or limited availability of certain types.

##### Resolution Strategies

- **Waiting Before Reattempting**:
    
    - **Immediate Action**: Pause for a short period before trying to launch the instance again. This window allows for potential changes in capacity as AWS dynamically reallocates resources.
    - **Rationale**: Capacity can be freed up as other users release resources, so a temporary shortage may be resolved quickly.
- **Breaking Down Instance Requests**:
    
    - **Approach**: If the need is for multiple instances, it is advisable to split the request and launch instances sequentially rather than simultaneously.
    - **Benefit**: Smaller, individual requests may have a better chance of being accommodated as they require less immediate capacity and can be distributed more easily by AWS's capacity management system.
- **Requesting Different Instance Types**:
    
    - **Alternative Solution**: If there is an immediate need for the resources, consider requesting a different instance type that might have more availability in the same AZ.
    - **Flexibility**: The chosen instance type can be changed later when the preferred instance type has available capacity. This can be done by stopping the instance, changing its type, and restarting it.
- **Requesting Instances in Alternate AZs**:
    
    - **Geographic Redistribution**: Try launching the required EC2 instances in a different Availability Zone within the same region.
    - **Consideration**: Ensure that operating across different AZs aligns with your application's architecture and does not introduce unacceptable latency or complexity.

##### Additional Considerations for Capacity Management

- **Scalable Design**: Architect systems to be resilient to such capacity issues by designing for scalability, including the use of multiple AZs for redundancy.
- **Use of Auto Scaling Groups**: Implement Auto Scaling groups with a configuration that spans multiple AZs, enhancing the likelihood of instance provisioning even when one AZ is capacity constrained.
- **Reserved Instances**: Leverage Reserved Instances to guarantee capacity. Reserved Instances provide a reservation of resources in a specific AZ, ensuring availability for your applications.
- **Spot Instances**: Consider using Spot Instances for flexible workloads. Spot Instances can provide significant cost savings and access to spare AWS capacity without the need for a specific AZ.
- **Regular Monitoring**: Establish monitoring to get insights into capacity and usage trends which can inform better decision-making for instance deployment.
- **AWS Support Engagement**: For persistent capacity issues, engage with AWS Support. They can offer insights or solutions specific to your use case and region.

#### Error Explanation: `# InstanceTerminatesImmediately`

- **Cause of the Error**: This message is an indicator that an EC2 instance has transitioned from the 'pending' state directly to the 'terminated' state shortly after launch, which is not a typical behavior for a healthy instance startup.
- **Common Reasons for the Issue**:
    - **EBS Volume Limit Reached**: The account has hit the limit for the number of Elastic Block Store (EBS) volumes or total gigabytes of storage that can be used, preventing the instance from accessing necessary storage resources.
    - **Corrupted EBS Snapshot**: The EBS snapshot used to create the root volume for the instance is corrupted, leading to a failure in provisioning the storage for the instance.
    - **Encrypted Volume Access**: The root EBS volume of the instance is encrypted, and the account does not have the necessary permissions to access the AWS Key Management Service (KMS) key required to decrypt it.
    - **Missing AMI Components**: The Amazon Machine Image (AMI) used to launch the instance is based on instance store and is missing a required part (like an image.part.xx file), resulting in an incomplete or corrupted AMI.

##### Resolution Steps

- **Investigate EC2 State Transition**:
    - **Immediate Action**: To identify the specific cause, review the EC2 console, especially the 'State transition reason' found in the Description tab of the instance details.
    - **Rationale**: AWS provides detailed error messages that can help pinpoint the exact issue leading to the immediate termination of the instance.

##### Additional Considerations for Troubleshooting

- **EBS Volume Audit**: Regularly audit EBS usage to ensure limits are not exceeded. Consider setting up alerts to monitor EBS usage against the set limits.
- **Snapshot Integrity Checks**: Perform integrity checks on EBS snapshots before using them to launch instances, especially if snapshots are copied between regions or accounts.
- **KMS Permissions Review**: Ensure that IAM policies are correctly configured to provide necessary permissions for the KMS keys used for EBS volume encryption.
- **AMI Validation**: Before launching instances, validate that AMIs, particularly those that are instance-store backed, are complete and have all necessary parts available.
- **Error Logging and Monitoring**: Implement logging and monitoring to capture and alert on instance state changes for rapid response to launch issues.
- **AWS Support Engagement**: If the issue persists and the cause is not evident, engage with AWS Support for assistance in diagnosing and resolving the instance launch failure.

#### AWS Limit Calculator

The AWS Limit Calculator, often referred to as the AWS Service Quotas, is a tool that allows you to view and manage your service limits (also known as quotas) within AWS. Service limits are essentially the maximum number of resources you can create in an AWS account; for example, the number of EC2 instances you can run, or the number of VPCs you can have. These quotas are in place to help customers manage resources and control costs, as well as to protect the AWS infrastructure from overuse that could impact service performance.

##### How the AWS Limit Calculator Works

1. **Visibility**: The AWS Limit Calculator provides a central view of the service quotas for your AWS account. It lists the current maximum number of resources you're allowed to create for each service.
    
2. **Tracking Usage**: The tool can be used to track your current usage against these limits, which is essential for understanding how close you are to reaching them. This can help you avoid service disruptions that occur when you hit a limit.
    
3. **Requesting Increases**: Through the AWS Limit Calculator, you can request increases to your service quotas. This is typically done through the AWS Management Console, where you can directly request a limit increase for a specific service.
    
4. **Automation with AWS CLI and SDKs**: You can also use the AWS Command Line Interface (CLI) or AWS Software Development Kits (SDKs) to manage and request service limit increases programmatically, which can be integrated into infrastructure as code (IaC) practices.

##### How an AWS Engineer Can Use It

1. **Capacity Planning**: By understanding service limits and current usage, an engineer can plan for capacity needs ahead of time, ensuring that there is always enough headroom for scaling resources as demand increases.
    
2. **Budgeting and Cost Control**: Keeping an eye on service quotas can help in budget forecasting and preventing unexpected spikes in costs due to over-provisioning.
    
3. **Managing Scalability**: For applications that need to scale based on demand, engineers can ensure that they do not run into service limits which could prevent scaling, thus maintaining application performance and availability.
    
4. **Operational Resilience**: By managing service quotas proactively, an engineer can prevent service disruptions and ensure operational resilience.
    
5. **Risk Management**: By setting appropriate limits, an engineer can mitigate risks such as resource exhaustion due to misconfigurations or security incidents.
    
6. **Automation and Alerts**: Engineers can use the tool in conjunction with CloudWatch and AWS Lambda to create alerts and automation workflows that respond to approaching service limits.
    
7. **Compliance**: For enterprises that need to adhere to specific governance and compliance standards, managing service quotas is an essential part of ensuring that the infrastructure complies with organizational policies and standards.

### EC2 SSH Troubleshooting

Troubleshooting SSH issues with EC2 instances involves a series of checks and validations to ensure connectivity. The key areas to check include permissions, configurations, and network connectivity.

#### Key SSH Connection Error Messages and Their Meanings

- **Unprotected Private Key File Error**: This error means the private key file used for SSH (typically a `.pem` file on Linux machines) does not have the correct permissions set. It should have restricted permissions to be read only by the owner.
    
- **Username and OS Compatibility**: The username provided for SSH must match the default username for the EC2 instance's operating system (e.g., `ec2-user` for Amazon Linux, `ubuntu` for Ubuntu, etc.). Incorrect usernames can lead to "Host key not found," "Permission denied," or "Connection closed by "instance port 22" errors.

#### Common Reasons for "Connection Timed Out" Errors

- **Security Group (SG) Misconfiguration**: The security group acts as a virtual firewall for the instance. If it's not correctly configured to allow inbound SSH traffic on port 22 from your IP address, the connection will time out.
    
- **Network Access Control List (NACL) Misconfiguration**: NACLs provide a layer of network security at the subnet level. Incorrect NACL rules can prevent incoming SSH traffic, leading to timeouts.
    
- **Route Table Misconfigurations**: The route table controls traffic leaving and entering a subnet. An improperly configured route table may not route SSH traffic correctly, especially if there's no route that directs traffic from the subnet to an Internet Gateway (IGW).
    
- **Absence of Public IPv4**: The EC2 instance must have a public IPv4 address to be accessible over the internet via SSH. Without a public IP, the instance will not be reachable unless connected through a VPN or a bastion host within the VPC.
    
- **High CPU Load**: A very high CPU load on the instance can cause slow responses or timeouts when attempting to connect via SSH.

#### Steps to Resolve SSH Connection Issues

1. **Validate Key Permissions**:
    
    - Ensure the private key file's permissions are set correctly using the `chmod` command: `chmod 400 /path/to/your-key.pem`.
2. **Verify Username and OS Compatibility**:
    
    - Confirm that you are using the correct username for the instance's operating system. Consult the AWS documentation for default usernames associated with different AMIs.
3. **Check Security Group Settings**:
    
    - Review the security group rules associated with the instance to ensure that there is an inbound rule allowing SSH (port 22) from your IP address or range.
4. **Inspect NACLs**:
    
    - Examine the NACLs for the subnet on which the EC2 instance resides, making sure that the inbound and outbound rules allow traffic on port 22.
5. **Review Route Tables**:
    
    - Look at the route tables to make sure there is a correct route that allows traffic to go from the subnet to an Internet Gateway if the instance needs to be accessed over the internet.
6. **Check Public IP Assignment**:
    
    - Confirm that the instance has been assigned a public IPv4 address. If not, and it's required, consider allocating and associating an Elastic IP with the instance.
7. **Monitor CPU Utilization**:
    
    - Monitor the instance's CPU load to ensure it's not too high, which can be done via the EC2 console or CloudWatch metrics.

### Instance Connect vs. SSH

#### Traditional SSH Connection

- **How it Works**: To connect using SSH, you typically use a private key that corresponds to a public key attached to the instance. You initiate the connection using an SSH client, providing the instance's public DNS or IP address and the private key file.
    
- **Security Groups**: The security group associated with the EC2 instance needs to have an inbound rule that allows traffic on port 22 (the standard port for SSH) from your IP address.

#### EC2 Instance Connect

- **What it Is**: EC2 Instance Connect provides a secure way to connect to your EC2 instances using SSH without the need to manage SSH keys for individual instances. It integrates with AWS IAM and provides temporary SSH access to the instance.
    
- **IAM Integration**: Instead of using a static SSH key, Instance Connect generates a one-time-use SSH public key each time a user connects. You need appropriate IAM permissions to push the public key to the instance and establish an SSH connection.
    
- **IP Ranges**: EC2 Instance Connect allows for connections from a broader range of IP addresses, not just a single IP. In the second part of the image, you can see the inbound rule in the security group allows SSH traffic from an AWS-owned IP range (18.206.107.24/29). This means that users connecting through EC2 Instance Connect must come from the approved AWS service IP range.
    
- **Temporary Access**: The SSH keys that EC2 Instance Connect uses are temporary and the connection logs are stored with AWS CloudTrail, adding an extra layer of auditability and security.

#### Key Differences and Security Implications

- **SSH Key Management**: Traditional SSH requires you to securely manage your SSH keys, while Instance Connect handles this for you, providing temporary access that integrates with IAM policies.
    
- **IP Whitelisting**: Traditional SSH often involves whitelisting individual IP addresses. Instance Connect allows an entire approved AWS service IP range, which can simplify access when users have dynamic IPs, but requires trust in the AWS service's IP range security.
    
- **Ease of Use**: Instance Connect simplifies access management by avoiding the need to distribute SSH keys to users and by using IAM roles for access control.
    
- **Approval of IP Ranges**: For Instance Connect, AWS publishes its IP address ranges in JSON format, which includes ranges used by EC2 Instance Connect. This allows you to approve access for these ranges via security group settings, ensuring that only traffic from AWS services can initiate an Instance Connect session.

Here's a breakdown of the EC2 Instance Connect IP ranges for each region:

- **China (Beijing) Region (cn-north-1)**: `43.196.20.40/29`
- **China (Ningxia) Region (cn-northwest-1)**: `43.192.155.8/29`
- **AWS GovCloud (US-East) Region (us-gov-east-1)**: `18.252.4.0/30`
- **AWS GovCloud (US-West) Region (us-gov-west-1)**: `15.200.28.80/30`
- **Africa (Cape Town) Region (af-south-1)**: `13.244.121.196/30`
- **Asia Pacific (Hong Kong) Region (ap-east-1)**: `43.198.192.104/29`
- **Asia Pacific (Tokyo) Region (ap-northeast-1)**: `3.112.23.0/29`
- **Asia Pacific (Seoul) Region (ap-northeast-2)**: `13.209.1.56/29`
- **Asia Pacific (Osaka) Region (ap-northeast-3)**: `15.168.105.160/29`
- **Asia Pacific (Mumbai) Region (ap-south-1)**: `13.233.177.0/29`
- **Asia Pacific (Hyderabad) Region (ap-south-2)**: `18.60.252.248/29`
- **Asia Pacific (Singapore) Region (ap-southeast-1)**: `3.0.5.32/29`
- **Asia Pacific (Sydney) Region (ap-southeast-2)**: `13.239.158.0/29`
- **Asia Pacific (Jakarta) Region (ap-southeast-3)**: `43.218.193.64/29`
- **Asia Pacific (Melbourne) Region (ap-southeast-4)**: `16.50.248.80/29`
- **Canada (Central) Region (ca-central-1)**: `35.183.92.176/29`
- **Europe (Frankfurt) Region (eu-central-1)**: `3.120.181.40/29`
- **Europe (Zurich) Region (eu-central-2)**: `16.63.77.8/29`
- **Europe (Stockholm) Region (eu-north-1)**: `13.48.4.200/30`
- **Europe (Milan) Region (eu-south-1)**: `15.161.135.164/30`
- **Europe (Milan) Region (eu-south-2)**: `18.101.90.48/29`
- **Europe (Ireland) Region (eu-west-1)**: `18.202.216.48/29`
- **Europe (London) Region (eu-west-2)**: `3.8.37.24/29`
- **Europe (Paris) Region (eu-west-3)**: `35.180.112.80/29`
- **Middle East (Tel Aviv) Region (il-central-1)**: `51.16.183.224/29`
- **Middle East (UAE) Region (me-central-1)**: `3.29.147.40/29`
- **Middle East (Bahrain) Region (me-south-1)**: `16.24.46.56/29`
- **South America (São Paulo) Region (sa-east-1)**: `18.228.70.32/29`
- **US East (N. Virginia) Region (us-east-1)**: `18.206.107.24/29`
- **US East (Ohio) Region (us-east-2)**: `3.16.146.0/29`
- **US West (N. California) Region (us-west-1)**: `13.52.6.112/29`
- **US West (Oregon) Region (us-west-2)**: `18.237.140.160/29`