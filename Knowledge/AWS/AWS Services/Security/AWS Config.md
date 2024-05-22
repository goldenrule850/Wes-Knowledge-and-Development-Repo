AWS Config is a service that enables you to assess, audit, and evaluate the configurations of your AWS resources. It continuously monitors and records your AWS resource configurations and allows you to automate the evaluation of recorded configurations against desired configurations.

### What is AWS Config?

1. **Configuration Recording**: AWS Config records the configuration changes that happen within your AWS environment. It acts as an inventory of your AWS resources, recording their current and historical configurations.
    
2. **Compliance Auditing**: It can help you to ensure compliance with internal policies or external regulations by enabling you to audit changes in the environment against compliance rules.
    
3. **Change Management**: AWS Config can track changes in configurations, relationships between AWS resources, and changes in permissions, providing a detailed view of changes over time.

#### How Does AWS Config Work?

1. **Resource Discovery**: AWS Config automatically discovers supported AWS resources present in your account and captures their current configurations.
    
2. **Configuration History**: As resources are changed, AWS Config records these changes and can store the configuration history for each resource.
    
3. **Configuration Snapshots**: You can also generate a point-in-time snapshot of the resources and their configurations.
    
4. **Rules for Compliance**: You can create and manage rules that represent your ideal configuration settings. AWS Config will continuously evaluate your resource configurations against these rules.
    
5. **Notifications and Remediation**: AWS Config can notify you when your resources drift from the desired configurations and can even trigger automated remediation actions.

#### Use Cases of AWS Config

1. **Security Analysis**: Track changes to security groups, network ACLs, or IAM roles and policies to ensure they meet your organization's security guidelines.
    
2. **Compliance Auditing**: Use AWS Config rules to ensure compliance with internal policies and external regulations by auditing and recording configuration changes across your AWS environment.
    
3. **Inventory and Change Management**: Keep a detailed inventory of your AWS resources and their configurations, making it easier to manage changes and troubleshoot issues.

#### Examples of When an AWS Config Event is Useful

1. **Unauthorized Security Group Changes**:
    
    - If a security group is altered to allow traffic from unauthorized IP addresses, AWS Config can record the change and notify you. It can also trigger an automated workflow to revert the security group to its original state.
2. **Tracking EC2 Instance Types**:
    
    - If your policy dictates that only certain types of EC2 instances should be used (e.g., for cost control), AWS Config can alert you if an instance is launched with an unauthorized type, enabling you to take corrective action.
3. **Compliance with Tagging Policies**:
    
    - AWS Config can enforce tagging policies by identifying resources that don't have the required tags and alerting administrators or even invoking a Lambda function to automatically apply the correct tags.

### Config's Passive Approach

AWS Config is primarily a monitoring and auditing service that helps you understand and evaluate the configurations of your AWS resources. It does not inherently prevent changes to your resources; instead, it tracks changes and can alert you when those changes do not comply with your specified guidelines.

#### AWS Config's Role in Change Tracking and Compliance

1. **Configuration Tracking**:
    
    - AWS Config continuously monitors the configuration state of your AWS resources.
    - When a resource is created, modified, or deleted, AWS Config records the new configuration state and can show you a timeline of configuration changes for each resource.
2. **Compliance Evaluation**:
    
    - You can define compliance rules in AWS Config, specifying how particular resources should be configured.
    - AWS Config evaluates resource configurations against these rules and flags any resources that are non-compliant.
3. **Alerting on Non-compliance**:
    
    - When AWS Config detects a resource that doesn't comply with your rules, it can send notifications using Amazon SNS.
    - This allows you to respond to non-compliant changes promptly, but the change itself is not blocked or prevented by AWS Config.

#### Difference Between AWS Config and Service Control Policies (SCPs)

Service Control Policies (SCPs) are part of AWS Organizations and offer a way to centrally control permissions for all accounts within your organization. SCPs differ from AWS Config in several key ways:

1. **Preventative Control**:
    
    - SCPs are used to manage permissions and can prevent actions from being taken if they violate the policy.
    - They are a form of guardrails that restrict what actions users and roles can perform in the accounts to which the SCPs are applied.
2. **Enforcement vs. Monitoring**:
    
    - While AWS Config is a monitoring tool that records and evaluates configurations post-change, SCPs enforce policies that prevent non-compliant actions before they occur.
3. **Scope of Control**:
    
    - SCPs apply to all users and roles in an AWS account and can limit the use of AWS services and resources at the account level.
    - AWS Config rules apply to the resources themselves and evaluate their configurations after changes are made.

### Config Scope

AWS Config is inherently a **regional service**; it operates within the region it is activated in and tracks changes for the resources in that region. However, to provide a more centralized view and manage resources across multiple accounts and regions, AWS Config supports cross-region and cross-account data aggregation.

#### Cross-Region and Cross-Account Aggregation

1. **Aggregator Setup**:
    
    - AWS Config allows you to set up an aggregator that collects configuration and compliance data from multiple accounts and regions.
    - This aggregated view is essential for centralized governance and compliance monitoring across an entire organization.
2. **Single Pane of Glass**:
    
    - The aggregator dashboard provides a single interface where you can view the configuration and compliance status of resources across the specified accounts and regions.

#### Integration with EventBridge and Lambda for Proactive Enforcement

AWS Config can be integrated with Amazon EventBridge (formerly CloudWatch Events) and AWS Lambda for proactive enforcement of configurations. This setup enables automatic responses to configuration changes that do not comply with the desired states.

1. **EventBridge Integration**:
    
    - AWS Config can stream configuration changes and compliance state changes as events to EventBridge.
    - You can set up EventBridge rules to match specific events, such as changes to security group configurations or deviations from compliance rules.
2. **Lambda for Remediation**:
    
    - Once a relevant event is detected by EventBridge, it can trigger an AWS Lambda function.
    - The Lambda function can then execute remediation actions, such as modifying a resource to bring it back into compliance or notifying administrators to take manual action.

#### Examples of Proactive Enforcement

1. **Automatic Resource Tagging**:
    
    - A Lambda function can be triggered if a new resource is created without proper tagging, which can then automatically add the required tags to the resource.
2. **Security Group Configuration Rollback**:
    
    - If a change to a security group opens a port that should not be exposed, a Lambda function can automatically revert the security group to its previous state.
3. **Unauthorized Route Table Modification Detection**:
    
    - If AWS Config detects an unauthorized change to a VPC route table, a Lambda function can be triggered to review the change and revert it if it does not meet organizational policies.

### Configuraiton Items

When AWS Config is enabled, it begins tracking and recording configuration changes across your AWS environment. Here's a detailed breakdown of how it works with Amazon S3 to store the recorded data:

#### Configuration Items (CIs)

- **Definition**: A Configuration Item (CI) is a record that captures the configuration state of an AWS resource at a particular point in time. It includes metadata like the AWS resource type, ID, ARN, AWS Region, creation time, and version.
    
- **Attributes**: CIs contain all the configuration attributes of a resource within your AWS account. For an EC2 instance, this might include its instance type, associated key pair, assigned security groups, and attached EBS volumes.
    
- **Relationships**: Each CI also captures relationships between resources, such as which VPC an EC2 instance resides in or which load balancer is associated with which EC2 instances.

#### Storing CIs in Amazon S3

- **Configuration History**: AWS Config maintains a configuration history for each resource by storing each state change as a separate CI. This history is a useful tool for auditing and security analysis, as it allows you to review the changes over time.
    
- **S3 Bucket Integration**: AWS Config uses an Amazon S3 bucket to store the CIs. You specify the bucket when you set up AWS Config, and it automatically stores all configuration snapshots and changes.
    
- **Security and Compliance**: The integration with Amazon S3 allows you to use S3 features for security and compliance, like bucket policies and access controls, to protect your configuration history.

#### Examples of Configuration Items

1. **EC2 Instance CI**: An EC2 instance CI would include details such as the instance's size (e.g., `t2.micro`), the attached AMI, the security groups it's associated with, its network interfaces, and status checks. It would also track its relationship to other resources like the VPC it's part of, the IAM role it's assuming, and any EBS volumes attached to it.
```json
{
  "version": "1.3",
  "configurationItemCaptureTime": "2023-04-01T12:30:00Z",
  "configurationItemStatus": "ResourceDiscovered",
  "configurationStateId": "12345678",
  "awsAccountId": "123456789012",
  "configurationItemMD5Hash": "examplehash",
  "arn": "arn:aws:ec2:us-west-2:123456789012:instance/i-0abcd1234efgh5678",
  "resourceType": "AWS::EC2::Instance",
  "resourceId": "i-0abcd1234efgh5678",
  "resourceName": "MyEC2Instance",
  "resourceCreationTime": "2023-04-01T11:25:00Z",
  "tags": {
    "Environment": "Production"
  },
  "relationships": [
    {
      "resourceId": "sg-0123456789abcdef0",
      "resourceType": "AWS::EC2::SecurityGroup",
      "relationshipName": "Is associated with SecurityGroup"
    },
    {
      "resourceId": "vol-01234567",
      "resourceType": "AWS::EC2::Volume",
      "relationshipName": "Uses volume"
    }
  ],
  "configuration": {
    "instanceType": "t2.micro",
    "keyName": "MyKeyPair",
    "amiId": "ami-0abcdef1234567890",
    "state": "running",
    "subnetId": "subnet-abcdef12",
    "vpcId": "vpc-01234abc"
  }
}
```
    
2. **Amazon DynamoDB Table CI**: A DynamoDB table CI would contain information about the table's structure, including its primary key schema, provisioned read and write capacity units, and any global or local secondary indexes. Relationships might include the table's connection to a specific AWS Region and any IAM policies that dictate access permissions to the table.
```json
{
  "version": "1.3",
  "configurationItemCaptureTime": "2023-04-01T13:00:00Z",
  "configurationItemStatus": "ResourceDiscovered",
  "configurationStateId": "23456789",
  "awsAccountId": "123456789012",
  "configurationItemMD5Hash": "examplehash",
  "arn": "arn:aws:dynamodb:us-west-2:123456789012:table/MyDynamoDBTable",
  "resourceType": "AWS::DynamoDB::Table",
  "resourceId": "MyDynamoDBTable",
  "resourceName": "MyDynamoDBTable",
  "resourceCreationTime": "2023-04-01T10:00:00Z",
  "tags": {
    "Project": "MyProject"
  },
  "configuration": {
    "tableName": "MyDynamoDBTable",
    "keySchema": [
      {
        "attributeName": "Id",
        "keyType": "HASH"
      }
    ],
    "provisionedThroughput": {
      "readCapacityUnits": 5,
      "writeCapacityUnits": 5
    }
  }
}
```
    
3. **AWS Lambda Function CI**: A CI for a Lambda function would document the function's runtime environment, handler name, associated execution role, timeout settings, environment variables, and more. The relationships would include the event source or trigger configuration, such as an S3 bucket or an SNS topic.
```json
{
  "version": "1.3",
  "configurationItemCaptureTime": "2023-04-01T14:45:00Z",
  "configurationItemStatus": "ResourceDiscovered",
  "configurationStateId": "34567890",
  "awsAccountId": "123456789012",
  "configurationItemMD5Hash": "examplehash",
  "arn": "arn:aws:lambda:us-west-2:123456789012:function:MyLambdaFunction",
  "resourceType": "AWS::Lambda::Function",
  "resourceId": "MyLambdaFunction",
  "resourceName": "MyLambdaFunction",
  "resourceCreationTime": "2023-04-01T09:15:00Z",
  "configuration": {
    "functionName": "MyLambdaFunction",
    "runtime": "python3.8",
    "handler": "lambda_function.lambda_handler",
    "role": "arn:aws:iam::123456789012:role/service-role/MyLambdaRole",
    "timeout": 30,
    "environmentVariables": {
      "Environment": "Production"
    }
  },
  "relationships": [
    {
      "resourceId": "MyDynamoDBTable",
      "resourceType": "AWS::DynamoDB::Table",
      "relationshipName": "Triggers table"
    }
  ]
}
```

### Config Rules

Config rules are guidelines that help you to automatically check the configuration of AWS resources and manage compliance against the desired configurations you define. These rules can be predefined (managed by AWS) or custom (defined by you) and can apply to various AWS resources.

#### What Are Config Rules?

1. **Automated Compliance Checks**: Config rules represent your internal best practices or compliance requirements. AWS Config continuously monitors your resources and flags any deviations from these rules.
    
2. **Customizable Parameters**: Each rule can have parameters that you can customize according to your needs, providing flexibility in how the rules are evaluated.
    
3. **AWS Managed and Custom Rules**: AWS offers managed rules, which are predefined, ready-to-use rules that address common compliance scenarios. Alternatively, you can create custom rules using AWS Lambda functions to evaluate more specific requirements or complex logic.

#### How Do Config Rules Work?

1. **Trigger Types**: Config rules can be triggered either by configuration changes (change-triggered) or at a set frequency (time-triggered, such as every 24 hours).
    
2. **Evaluation**: When a rule is triggered, AWS Config evaluates the related resource's configuration against the rule's logic. It then reports whether the resource is compliant or non-compliant.
    
3. **Automated Remediation**: Optionally, you can set up automatic remediation actions that adjust the resource configurations to bring them into compliance when a rule detects a deviation.
    
4. **Notifications**: AWS Config can send notifications via Amazon SNS when a resource is found to be non-compliant, allowing for prompt action.

#### Use Cases for Config Rules

1. **Ensuring Security Postures**: Rules can be set up to ensure that security group rules do not allow unrestricted access to specific ports, or that IAM policies do not allow overly broad permissions.
    
2. **Compliance Monitoring**: Config rules can help you comply with external regulations by continuously checking that your resources adhere to required standards, such as ensuring that data storage is encrypted.
    
3. **Standardization of Resources**: Enforce standard configurations across your environment, such as requiring specific tags on all resources for cost allocation and tracking.

#### Examples of Config Rules

1. **Encrypted Volumes**: A rule that checks whether EBS volumes attached to EC2 instances are encrypted. For any unencrypted volumes, the rule flags the instance as non-compliant.
    
2. **Instance Type Compliance**: A rule that checks whether EC2 instances are of a particular type or within a specified range. If an instance type does not match the rule's criteria, it is marked as non-compliant.
    
3. **S3 Bucket Public Write Prohibition**: A rule to ensure that no S3 buckets are configured to allow public write access. If a bucket's policy permits public writes, the rule would flag it as non-compliant.

Config rules come in two main types: **AWS managed rules** and **custom rules**. Managed rules are predefined, turnkey rules created by AWS that address common compliance scenarios. Custom rules are user-defined and can be tailored to specific requirements or more complex logic.

#### AWS Managed Rules

1. **Predefined Rules**: AWS provides a collection of managed rules, which are designed to evaluate whether your AWS resources comply with common best practices.
    
2. **Ease of Use**: Managed rules are easy to set up and use because AWS has already defined the rule logic. You simply choose from a list and configure any necessary parameters.

#### Custom Rules

1. **User-Defined Logic**: Custom rules are defined by you. You create the logic that dictates how resources should be evaluated, usually by writing a Lambda function that defines the compliance criteria.
    
2. **Flexibility and Specificity**: Custom rules offer the flexibility to assess compliance based on the unique requirements of your organization.
    
3. **AWS Lambda Integration**: Custom rules are triggered by configuration changes or periodic evaluations, and a Lambda function is invoked to evaluate the resource configuration.

