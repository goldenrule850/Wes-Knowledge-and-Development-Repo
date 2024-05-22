AWS Resource Access Manager (RAM) is a service designed to facilitate the sharing of AWS resources across different AWS accounts and within an AWS Organization. It simplifies the process of sharing resources while maintaining security and efficiency. Here's a detailed look at what it is, how it works, its use cases, and the services it offers:

### What is AWS Resource Access Manager?

1. **Resource Sharing**: AWS RAM allows you to share AWS resources like VPC subnets, Route 53 Resolver rules, and AWS Transit Gateways with other AWS accounts or within your AWS Organization.
    
2. **Access Control**: It provides a secure way to share resources, ensuring that only authorized accounts have access.
    
3. **Centralized Management**: It enables centralized management of shared resources, reducing the need for duplicate resources and minimizing costs.

#### How It Works

1. **Owner Account**: The account that owns the resource (the "owner") initiates the sharing process in AWS RAM.
    
2. **Resource Sharing**: The owner specifies which resources to share and invites other AWS accounts (the "participants") to share these resources.
    
3. **Acceptance by Participants**: The invited accounts need to accept the invitation to access the shared resources.
    
4. **Use of Shared Resources**: Once accepted, the shared resources can be used by participant accounts as if they own them, subject to permissions set by the owner.

#### Use Cases

1. **Cost-Efficient Resource Utilization**: Sharing resources like subnets or transit gateways eliminates the need for each account to create its own, reducing costs.
    
2. **Simplified Network Management**: Share network resources for easier management of a centralized network across multiple accounts.
    
3. **Centralized Resource Control**: Manage critical resources from a central account, ensuring consistent policies and configurations.
    
4. **Collaboration Across Accounts**: Facilitate collaboration by sharing resources across different accounts within an organization or with external partners.
    
5. **Streamlining Multi-Account Architectures**: Essential for organizations using a multi-account strategy to ensure efficient resource usage and access.

#### Services Offered by AWS RAM

AWS RAM allows sharing of various resources, including but not limited to:

1. **Amazon Virtual Private Cloud (VPC)**: Subnets, Network Interfaces, etc.
2. **AWS Transit Gateway**: Share transit gateways for network connectivity.
3. **Amazon Route 53 Resolver Rules**: Share DNS resolver rules across accounts.
4. **AWS License Manager Configurations**: Share license configurations to manage software licenses.
5. **Amazon Resource Groups**: Share resource groups for organized resource management.
6. **AWS CodeBuild Projects**: Share build projects for collaborative development.
7. **Amazon CloudWatch Logs Insights Queries**: Share saved queries for operational insights.
8. **AWS OpsWorks for Chef Automate and Puppet Enterprise**: Share OpsWorks resources for configuration management.

### Resource Access Manager Permissions

AWS Resource Access Manager (RAM) uses permissions to control access to shared resources. These permissions are managed through AWS Identity and Access Management (IAM) policies and RAM's own sharing mechanisms. Understanding the different types of permissions and how they work is crucial for effectively managing access to shared resources.

#### Types of RAM Permissions

AWS Resource Access Manager (RAM) manages permissions through two types: **AWS managed permissions** and **customer managed permissions**. These permissions define how resources shared in a resource share can be accessed and used by consumers (other AWS accounts or organizational units). Here's a simplified summary to understand and remember:

#### Managing Permissions in AWS RAM:

1. **Managed Permissions**: Determine how consumers can interact with shared resources.  
    
2. **Resource Share**: When you create a resource share, you select a managed permission for each resource type included. This sets the access rules for the resources.
    
3. **Policy Template**: Managed permissions use a policy template, which includes all necessary elements for a resource-based policy, except for the principal (who can access) and the resource itself.
    
4. **Completing the Policy**: The Amazon Resource Name (ARN) of the resource and the ARNs of the principals complete the policy, allowing AWS RAM to author a full resource-based policy.
    
5. **Versions of Managed Permissions**:
    
    - **AWS Managed Permissions**: Have multiple versions, with one being the default. AWS may update these permissions by creating new versions.
    - **Customer Managed Permissions**: You can create and update your own versions of managed permissions.
    - **Version Default**:  If the managed permission has more than one version, the new resource share always uses the version designated as the default.
6. **Updates and Resource Shares**: Existing resource shares don't automatically update to new versions of managed permissions. The AWS RAM console shows when a new default version is available, and you can review and compare changes before applying them.

#### How They Work

- **Resource Owner**: The owner account uses RAM to share resources with specific AWS accounts or an organization. The owner can set permissions on the shared resources, defining what actions the participants can perform.
    
- **Resource Participant**: The participant accounts must accept the shared resources. They can then use IAM policies to grant their users and roles permissions to interact with these resources.
    
- **IAM Role Delegation**: Often, participant accounts will create IAM roles that are attached to policies granting permissions to use the shared resources. Users in the participant account assume these roles to access the resources.

#### Example Scenario

**Scenario**: A company, "Galaxy Tech," has two AWS accounts - a production account and a development account. They want to share a common AWS Transit Gateway from the production account with the development account to streamline network connectivity.

**Steps**:

1. **Production Account (Owner)**:
    
    - The network administrator in the production account shares the Transit Gateway using AWS RAM.
    - They create a RAM resource share and include the Transit Gateway resource.
    - They specify the development account as the participant.
2. **Development Account (Participant)**:
    
    - The development account receives an invitation to join the resource share.
    - The administrator in the development account accepts the invitation.
    - They create an IAM policy that grants necessary permissions to access and use the shared Transit Gateway. This policy might include permissions to attach VPCs to the Transit Gateway, view routes, etc.
    - They attach this IAM policy to an IAM role that developers can assume.

**IAM Policy Example**:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ec2:DescribeTransitGateways",
        "ec2:DescribeTransitGatewayAttachments",
        "ec2:CreateTransitGatewayVpcAttachment",
        "ec2:DeleteTransitGatewayVpcAttachment"
      ],
      "Resource": "*"
    }
  ]
}
```

**Outcome**: Developers in the development account can now assume the specified IAM role to access and manage the shared Transit Gateway, allowing them to connect their VPCs to the production network infrastructure as needed for testing and development purposes.

#### AWS Managed Permissions in AWS RAM:

1. **Default Managed Permission for Each Resource Type**:
    
    - Every resource type supported by AWS RAM has a default managed permission.
    - This default permission is used unless you choose a different one.
    - It's designed to cover the most common sharing scenarios for that resource type.
2. **Actions Defined by Default Permissions**:
    
    - These permissions allow specific actions based on the resource type.
    - For example, the default managed permission for Amazon VPC ec2:Subnet resource type includes actions like `ec2:RunInstances`, `ec2:CreateNetworkInterface`, and `ec2:DescribeSubnets`.
3. **Naming Format**:
    
    - The names of these default permissions follow a format: AWSRAMDefaultPermissionResourceType.
    - Example: For `ec2:Subnet`, the default permission is named `AWSRAMDefaultPermissionSubnet`.
4. **Different Versions and Scenarios**:
    
    - Despite being default, these permissions are separate from other versions.
    - All managed permissions, including AWS managed and customer managed, can have multiple versions.
    - Different versions support various sharing scenarios, like read-write access versus read-only access.
##### Example Scenario:

**Situation**: A company, "Star Innovations," has an AWS environment with multiple teams requiring different levels of access to the same Amazon VPC subnet.

**Solution Using AWS RAM**:

1. **Administrator Access**:
    
    - For the admin team, Star Innovations creates a resource share using the full access (Read and Write) managed permission for the `ec2:Subnet`.
    - This allows the admin team to perform all necessary actions like running instances, creating network interfaces, etc.
2. **Developer Access**:
    
    - For the developer team, they create a separate resource share with a read-only managed permission.
    - This restricts the developers to view-only access, adhering to the principle of least privilege.

**Outcome**: By utilizing AWS RAM's managed permissions, Star Innovations effectively shares the VPC subnet among different teams with appropriate access levels. Admins have full control, while developers have restricted, read-only access, ensuring security and efficiency in resource management.

#### Customer Managed Permissions in AWS RAM:

1. **Customized Access Control**:
    
    - You author and maintain these permissions.
    - They enable you to define exactly which actions can be performed on shared resources and under what conditions.
2. **Implementing Least Privilege**:
    
    - This approach aligns with the best practice of granting only the necessary permissions for specific tasks on shared resources.
    - It ensures tighter security by minimizing unnecessary access.

#### Example Scenario:

**Situation**: A healthcare company, "MediCorp," uses AWS for its data processing and analysis needs. They have a central AWS account with sensitive patient data stored in Amazon S3 buckets.

**Goal**: Share these S3 buckets with various research teams across the company, but restrict them from deleting any data to maintain data integrity and comply with regulatory requirements.

**Solution Using Customer Managed Permissions**:

1. **Creating Customer Managed Permission**:
    
    - MediCorp creates a custom managed permission in AWS RAM specifically for the S3 buckets.
    - The permission includes actions like `s3:GetObject`, allowing researchers to read and download files.
    - It explicitly excludes `s3:DeleteObject` and `s3:PutObject` permissions to prevent modification or deletion of data.
2. **Resource Sharing with Research Teams**:
    
    - MediCorp shares the S3 buckets with the research team accounts using the newly created customer managed permission.
    - Researchers can access and analyze data but cannot alter or remove it.

**Outcome**: MediCorp successfully shares critical patient data with its research teams, ensuring data security and compliance with healthcare regulations. Researchers can access the necessary data for their work without the risk of accidentally deleting or modifying sensitive information.

### VPC Sharing

VPC (Virtual Private Cloud) sharing is a feature in AWS that allows multiple AWS accounts to access and use the same VPC. It's particularly useful in large organizations or in scenarios involving multiple departments, projects, or teams that require network isolation but can benefit from some shared network infrastructure. VPC sharing is facilitated through AWS Resource Access Manager (RAM).

#### How VPC Sharing Works

1. **Shared VPC Owner**: One AWS account, known as the VPC owner, creates the VPC and then shares its subnets with other AWS accounts (participants).
    
2. **Subnet Sharing**: The VPC owner can share specific subnets within the VPC, while denying access to the entire VPC. This allows for granular control over what is shared.
    
3. **Resource Separation**: Each participant account can launch its AWS resources, like EC2 instances or RDS databases, within the shared subnets. These resources are isolated and operate as if they are in the participant’s own VPC.
    
4. **Security and Control**: The VPC owner maintains control over the VPC, including network ACLs, route tables, and VPC endpoints. Participants have control over their resources but cannot modify the shared network infrastructure.
    
5. **Billing**: The VPC owner account is billed for the shared network resources, while participant accounts are billed for their own resources deployed in the shared subnets.

#### Scenario: VPC Sharing in a Multi-Department Organization

**Situation**: A large corporation, “Orion Enterprises,” has separate AWS accounts for its different departments - R&D, Marketing, and Sales. They want to implement a shared services model for common infrastructure while maintaining isolation and control over department-specific resources.

**Goal**: Share a common VPC for basic networking infrastructure but ensure that each department only has access to its designated resources and cannot interfere with others.

**Steps**:

1. **Corporate IT (VPC Owner)**:
    
    - Creates a VPC in their AWS account with multiple subnets.
    - Shares specific subnets with each department’s AWS account using AWS RAM. For example, Subnet A is shared with R&D, Subnet B with Marketing, and Subnet C with Sales.
    - Sets up VPC-level security like Network ACLs and Route Tables.
2. **R&D, Marketing, and Sales Departments (Participants)**:
    
    - Accept the invitation to join the resource share from Corporate IT.
    - Launch their resources, such as EC2 instances and RDS databases, in their designated shared subnets.
    - Apply their security groups and IAM policies for their resources.

**IAM Policy for Restricted Access**:

For the participant departments, an IAM policy is set to restrict their actions to specific subnets. Here's an example for the R&D department:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "ec2:RunInstances",
      "Resource": [
        "arn:aws:ec2:region:account-id:subnet/subnet-id-A"
      ]
    }
  ]
}
```

**Outcome**:

- Each department operates within the shared VPC but is restricted to its subnet, maintaining resource isolation.
- Corporate IT retains control over the shared VPC infrastructure, ensuring consistent network policies and security.
- Departments save costs by not having to set up and manage separate VPCs.

