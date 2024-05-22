
### What is RDS Custom?

Amazon RDS Custom is a service within AWS that enables users to set up, operate, and scale a relational database in the cloud. It provides resizable capacity and automates time-consuming administrative tasks such as hardware provisioning, database setup, patching, and backups. RDS Custom allows users to customize the database engine, version, and parameter settings to suit specific application requirements.
### Filling the Gaps between RDS and EC2 Instances Running a DB Engine

Amazon RDS Custom is designed to bridge the gap between Amazon RDS and running a database engine on an Amazon EC2 instance. Here’s how it achieves this:

1. **Customization:**
    
    - **EC2 Instance:** Running a DB engine on an EC2 instance offers high customization. Users have full control over the OS, DB engine, configurations, and parameter settings.
    - **Traditional RDS:** Offers managed service with predefined configurations and limited customization.
    - **RDS Custom:** Provides the best of both worlds. It allows for customization of the DB engine, version, and parameters, while still offering managed service benefits.
2. **Administrative Overhead:**
    
    - **EC2 Instance:** Requires users to manage administrative tasks such as backups, patching, and scaling, which can be time-consuming.
    - **Traditional RDS:** Automates administrative tasks, reducing the management overhead.
    - **RDS Custom:** Retains automated management of administrative tasks while offering additional customization, balancing flexibility and convenience.
3. **Scaling:**
    
    - **EC2 Instance:** Users are responsible for implementing scaling, which can be complex.
    - **Traditional RDS:** Offers built-in scaling options, both vertical and horizontal.
    - **RDS Custom:** Allows users to leverage AWS scaling features and customize them to suit specific application needs.
4. **Security:**
    
    - **EC2 Instance:** Users are responsible for implementing and managing security measures.
    - **Traditional RDS:** Comes with built-in security features such as VPC integration, encryption, and IAM integration.
    - **RDS Custom:** Offers enhanced security through customizable settings while retaining the security features of traditional RDS.

### Differences from Traditional RDS

1. **Level of Customization:**
    
    - **Traditional RDS:** Limited to predefined configurations and parameter settings.
    - **RDS Custom:** Allows for a higher degree of customization, including the choice of DB engine, version, and custom parameter groups.
2. **Configuration Management:**
    
    - **Traditional RDS:** Users select from available configurations and parameter groups provided by AWS.
    - **RDS Custom:** Users can create and apply custom configurations and parameter groups to tailor the database behavior to specific needs.
3. **Use Cases:**
    
    - **Traditional RDS:** Ideal for standard applications that do not require specialized database configurations.
    - **RDS Custom:** Suited for custom applications, hybrid cloud environments, and scenarios where specific database configurations are essential.
4. **Complexity:**
    
    - **Traditional RDS:** Simplified management due to standardized settings.
    - **RDS Custom:** Increased complexity due to the management of custom configurations, requiring a deeper understanding of database management.
#### How Does RDS Custom Work?

1. **Provisioning:**
    
    - Users start by selecting the database engine, version, and instance type.
    - AWS allocates the necessary resources and sets up the database instance.
2. **Configuration:**
    
    - Users can configure settings such as security, network, and backups.
    - Custom parameter groups can be applied to tailor the database behavior.
3. **Scaling:**
    
    - RDS Custom offers both vertical and horizontal scaling options.
    - Users can adjust the instance type or add read replicas to handle increased load.
4. **Management:**
    
    - AWS handles maintenance tasks such as patching and backups.
    - Users can monitor performance and set up alerts through Amazon CloudWatch.
5. **Data Security:**
    
    - RDS Custom integrates with AWS Identity and Access Management (IAM) for access control.
    - Data is encrypted at rest and in transit using AWS Key Management Service (KMS).

#### Use Cases for RDS Custom

1. **Custom Applications:**
    
    - Developers building custom applications can use RDS Custom to tailor the database to their specific needs, ensuring optimal performance and security.
2. **Migration to Cloud:**
    
    - Organizations migrating on-premises databases to the cloud can leverage RDS Custom to replicate their existing configurations and parameter settings.
3. **Hybrid Cloud Environments:**
    
    - RDS Custom is ideal for businesses operating in a hybrid cloud environment, as it allows for customization to meet both on-premises and cloud requirements.
4. **Highly Variable Workloads:**
    
    - For applications with varying database workloads, RDS Custom offers the flexibility to adjust settings and scale resources as needed.

#### Limitations of RDS Custom

1. **Cost:**
    
    - Customization may lead to increased costs due to the use of additional resources and features.
2. **Complexity:**
    
    - Managing custom configurations can be complex and may require a deeper understanding of database management.
3. **Vendor Lock-in:**
    
    - RDS Custom is a proprietary AWS service, which may lead to vendor lock-in, making it challenging to migrate to other cloud providers.

### RDS Custom: Compatibility and Connectivity

#### Compatibility with MS SQL and Oracle SQL

Amazon RDS Custom is specifically designed to work with Microsoft SQL Server (MS SQL) and Oracle SQL, two of the most widely used relational database management systems. These database engines are known for their robustness, versatility, and support for complex queries and transactions, making them suitable for a variety of applications.

1. **MS SQL:**
    
    - RDS Custom allows users to customize MS SQL instances, tailoring configurations, and parameter settings to meet specific application requirements.
    - Users can select the desired version of MS SQL and apply custom parameter groups for optimized performance and security.
2. **Oracle SQL:**
    
    - With RDS Custom, users have the flexibility to configure Oracle SQL instances with custom settings and parameter groups.
    - Different editions and versions of Oracle SQL can be selected based on the application’s needs and licensing requirements.

#### Connecting to the Database

RDS Custom offers multiple connectivity options, allowing users to interact with their databases securely and efficiently. The three primary methods of connecting to an RDS Custom database are Session Manager, SSH (Secure Shell), and RDP (Remote Desktop Protocol):

1. **Session Manager:**
    
    - Session Manager is a fully managed AWS Systems Manager capability that lets users manage their Amazon EC2 instances, on-premises instances, and virtual machines (VMs) through an interactive one-click browser-based shell or through the AWS CLI.
    - Users can connect to their RDS Custom instances using Session Manager, providing a secure and auditable way to access the database.
2. **SSH (Secure Shell):**
    
    - SSH is a cryptographic network protocol used for securely accessing network services over an unsecured network.
    - Users can use SSH to connect to the underlying operating system of the RDS Custom instance, allowing for secure command-line access to the database.
3. **RDP (Remote Desktop Protocol):**
    
    - RDP is a proprietary protocol developed by Microsoft that allows users to connect to a remote computer or virtual machine over a network connection.
    - For RDS Custom instances running MS SQL, users can use RDP to connect to the Windows operating system hosting the database, providing a graphical interface for managing the database.

### RDS Custom: Viewing Resources

With RDS Custom, users gain more visibility and control over the underlying resources, including the ability to see the database EC2 instance, the attached EBS volumes, and any backups created. This enhanced visibility is particularly beneficial for users who require a higher degree of customization and management over their database environments.

#### Viewing the Database EC2 Instance and EBS Volumes:

1. **AWS Management Console:**
    
    - Navigate to the Amazon RDS Console.
    - In the navigation pane, choose “Databases”.
    - Select the RDS Custom DB instance you want to view.
    - Under the “Instance Details” section, you can view the associated EC2 instance and its details.
    - To view the attached EBS volumes, navigate to the “Volumes” tab.
2. **AWS CLI:**
    
    - Use the AWS Command Line Interface (CLI) to list and describe your RDS Custom DB instances, associated EC2 instances, and EBS volumes using appropriate AWS CLI commands.

#### Finding and Managing Backups:

1. **Amazon RDS Console:**
    
    - Navigate to the Amazon RDS Console.
    - In the navigation pane, choose “Snapshots”.
    - Here, you can view all manual and automatic snapshots (backups) associated with your RDS Custom instances.
    - You can filter the snapshots by DB instance identifier to find backups for a specific RDS Custom instance.
2. **AWS Backup:**
    
    - AWS Backup is a fully managed backup service that makes it easy to centralize and automate the backup of data across AWS services.
    - Navigate to the AWS Backup Console.
    - In the navigation pane, choose “Protected resources” or “Backup jobs” to view and manage backups of your RDS Custom instances.
3. **AWS CLI:**
    
    - Use the AWS CLI to list and describe your RDS snapshots and AWS Backup jobs using appropriate AWS CLI commands.

By leveraging the AWS Management Console, AWS Backup, and AWS CLI, users can effectively view and manage the EC2 instances, EBS volumes, and backups associated with their RDS Custom instances, ensuring optimal configuration and data protection.

### RDS Custom Database Automation

In Amazon RDS Custom, database automation plays a crucial role in managing the setup, operation, and scaling of databases in the cloud. It automates various tasks such as backups, patching, and maintenance, allowing users to focus on application development and other priorities.

#### What is Database Automation in RDS?

Database automation in Amazon RDS encompasses a range of tasks and processes designed to streamline database management. These include:

- **Automated Backups:** Regular snapshots of the database are taken automatically to facilitate recovery in case of data loss.
- **Patching:** The service automatically applies patches to the database engine, ensuring security and performance.
- **Scaling:** RDS Custom can automatically adjust resources based on workload requirements.
- **Maintenance:** Routine maintenance tasks are performed automatically to keep the database running smoothly.

#### Pausing and Resuming Database Automation:

When configuring or customizing an RDS Custom database, it may be necessary to pause database automation. This is to prevent any automated tasks from interfering with the changes being made. Here’s how you can pause and then re-enable database automation:

1. **Pausing Automation:**
    
    - Navigate to the Amazon RDS Console.
    - Select the RDS Custom DB instance you are working on.
    - Choose the option to pause automation.
    - Specify the duration for pausing the automation based on the time required to complete the configuration or customization.
2. **Configuring or Customizing the Database:**
    
    - With automation paused, proceed to make the necessary configuration changes, customizations, or installations.
    - Ensure that all changes are properly applied and tested.
3. **Resuming Automation:**
    
    - Once the changes have been successfully made and verified, return to the Amazon RDS Console.
    - Select the RDS Custom DB instance.
    - Choose the option to resume automation.
    - Automation will be re-enabled, and the service will resume managing the automated tasks.

By pausing and resuming database automation in RDS Custom, users can safely make customizations or configurations to their databases without the risk of conflicts with automated processes. This feature enhances the flexibility of RDS Custom, allowing for a tailored database environment while still benefiting from the convenience of automation.

