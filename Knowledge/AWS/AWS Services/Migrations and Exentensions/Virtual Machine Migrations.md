### AWS Application Discovery Service

AWS Application Discovery Service is designed to help enterprise customers plan migration projects by gathering information about their on-premises data centers.

#### What It Is

1. **Data Collection and Identification:**
    
    - The service collects and presents detailed information about on-premises data center configurations, usage, and behavior. This data is essential for effectively planning a migration.
2. **Infrastructure Understanding:**
    
    - It provides insights into server utilization and dependencies, helping to identify which applications are interdependent and how they should be grouped for migration.

#### How It Works

1. **Agent-Based Discovery:**
    
    - You can install agents on your on-premises servers that will collect data about hardware configuration, network connections, and system performance.
2. **Agentless Discovery:**
    
    - Alternatively, for environments where you cannot install agents, AWS Application Discovery Service can perform an agentless discovery to collect similar information.
3. **Data Aggregation and Presentation:**
    
    - The collected data is aggregated within the Application Discovery Service and can be presented in the AWS Migration Hub for a consolidated view of your on-premises resources.
4. **Export and Integration:**
    
    - Data collected can be exported for further analysis and is compatible with various AWS migration tools, helping to create a data-driven migration plan.

#### Relation to VM Migrations into AWS

1. **Migration Planning:**
    
    - The information collected by Application Discovery Service is critical for migration planning. It helps you determine the complexity, costs, and priorities for migrating virtual machines (VMs) to AWS.
2. **Performance Baselines:**
    
    - By understanding the performance characteristics of on-premises VMs, you can better select the right type and size of AWS resources, ensuring that your migrated VMs are optimized for cost and performance.
3. **Dependency Mapping:**
    
    - Application Discovery Service identifies dependencies between applications and workloads, which is crucial when you're planning the migration of VMs that interact with each other. This ensures that dependent applications are migrated together or in the correct sequence.

#### Example Scenario: Using Application Discovery Service for VM Migration

A financial institution is planning to migrate its on-premises VMs to AWS. They use the AWS Application Discovery Service to understand their current environment:

- **Data Collection:** They opt for an agent-based discovery for detailed server metrics and an agentless discovery for VMs where agents cannot be installed.
- **Analysis:** After collecting data, the institution uses the service to understand the usage patterns and dependencies of their VMs.
- **Migration Planning:** Using insights from the service, they identify critical applications, any underutilized VMs that can be consolidated, and the proper order for migrating groups of interdependent VMs.
- **Resource Matching:** They match their on-premises VMs with the appropriate EC2 instances, ensuring that each application has the necessary compute, memory, and storage resources in AWS.
- **Migration Execution:** They carry out the migration, beginning with the least critical applications to validate the process before proceeding to the more critical ones.

#### Data It Collects

##### Configuration Data

- **Server Specifications:** Details about physical and virtual servers, including CPU, memory, disk, and network configurations.
- **Installed Software:** Information on installed operating systems and applications, including versions and configurations.

##### Performance Data

- **Utilization Metrics:** CPU, disk I/O, network I/O, memory utilization, and process data to understand the performance profile and demands of each server.
- **Process Information:** Running processes and their consumption of system resources.
- **Throughput and Latency:** Measurements of data processing rates and response times, which can be critical for understanding the performance of applications.

##### Network Data

- **Network Traffic:** Insights into the data flow between assets in the data center, which helps to map communication and dependency between applications and workloads.
- **Network Configuration:** Information about network configurations, including IP addresses, MAC addresses, and port configurations.

##### Business Data

- **Asset Utilization:** How servers, storage, and networking are being used within the business context, which can reveal under or overutilized assets.
- **Cost Estimates:** Estimated costs for running on-premises infrastructure that can be compared to projected costs in the cloud to assist in cost-benefit analysis.

##### Usage Patterns

- **Peak and Off-Peak Usage:** Identification of peak usage times and patterns to help plan for capacity and scaling in the cloud.
- **Seasonal Trends:** Longer-term trends that might affect how resources are allocated in the cloud.

##### Dependency Mapping

- **Interdependencies:** How different systems interact and depend on each other, which is crucial for determining the order of migration and ensuring that related systems are moved together.

##### Security and Compliance Data

- **Security Configurations:** Current security settings and mechanisms in place, which will need to be replicated or enhanced in the cloud.
- **Compliance Posture:** Data related to compliance with various regulations, which can influence how data is migrated and handled in the cloud.

##### Application Discovery Service also collects this data in a variety of contexts:

- **Agent-Based:** For comprehensive and detailed data collection where agents can be installed on VMs.
- **Agentless:** For environments where installing agents is not possible or practical.

### AWS Server Migration Service

#### Lift-and-Shift Migration

AWS SMS epitomizes the lift-and-shift migration strategy. This involves taking your existing server workloads — as they are, with their current configurations, operating systems, and applications — and migrating them to AWS. This approach minimizes the need for application changes, which can be beneficial when you have complex applications for which re-architecting would be risky or time-consuming.

- **Process:** AWS SMS automates the process of creating replicas of your virtual machines (VMs) and turning them into ready-to-use AWS AMIs.
- **Benefit:** The significant advantage of this approach is that it reduces the migration complexity and allows organizations to quickly gain the benefits of the AWS cloud without the expense and risk of significant reconfiguration.

#### Integration with AWS Application Discovery Service

Integration with AWS Application Discovery Service is a critical feature of AWS SMS. Application Discovery Service helps you understand your on-premises workloads in depth before migration.

- **Functionality:** It collects detailed information about your on-premises environments, which can then be used by AWS SMS to ensure a more informed and smoother migration process.
- **Data Utilization:** Information such as server specifications, utilization data, and interdependencies are vital for planning your migration batches and sequencing to reduce risk.

#### Agentless Service

AWS SMS is an agentless service, meaning it does not require you to install software agents on your on-premises servers to perform the migration.

- **Mechanism:** Instead, it connects directly to your virtualization environment, using native replication mechanisms to move VMs to AWS.
- **Benefits:** This agentless approach simplifies the initial setup, reduces the potential for disruptions, and lowers the overhead of maintaining migration-specific software on your existing servers.

#### Integration with VMware, Hyper-V, and Azure VM

AWS SMS supports the most common virtualization platforms: VMware vSphere, Microsoft Hyper-V, and Azure VMs.

- **VMware vSphere:** A server virtualization platform that provides a robust, production-proven, high-performance virtualization layer.
- **Microsoft Hyper-V:** A virtualization product from Microsoft that allows users to run multiple operating systems as virtual machines on Windows.
- **Azure VMs:** Microsoft's cloud computing service for building, testing, deploying, and managing applications and services through Microsoft-managed data centers.

#### Incremental Replication of Live Volumes

One of the key features of AWS SMS is its ability to replicate live server volumes incrementally.

- **Process:** After the initial replication of the entire server volume, only the changes to the volume (delta) are replicated to AWS. This ensures that the latest version of your applications and data is available in AWS without having to perform full replications each time.
- **Zero Downtime:** This incremental replication allows for migrations to occur in the background, with minimal to no downtime. This is crucial for maintaining business continuity during the migration process.

#### Multi-Server Migrations

AWS SMS is not limited to single server migrations. It can handle multi-server migrations, which is essential for applications that are distributed across multiple servers.

- **Coordination:** The service can orchestrate the migration of several servers simultaneously or in a particular sequence if there are interdependencies.
- **Consistency Groups:** AWS SMS supports the concept of consistency groups to ensure that multi-server applications maintain transaction integrity during migration.

#### Creation of AMIs and Launch into EC2 Instances

Once the server volumes are replicated to AWS, SMS creates Amazon Machine Images (AMIs) of these volumes.

- **AMI Utilization:** These AMIs can be used to launch Amazon EC2 instances that are replicas of the on-premises servers.
- **Flexibility:** Post-migration, you have the flexibility to choose the appropriate EC2 instance type and size to optimize performance and cost in the cloud environment.

#### Integration with AWS Migration Hub

AWS SMS integrates with AWS Migration Hub, providing a single location to track the progress of migrations across multiple AWS and partner solutions.

- **Centralized Tracking:** Migration Hub gives you visibility into the status of migrations, making it easier to monitor and manage all your migration tasks from a single place.
- **Aggregated View:** You can see an aggregated view of all migrations, understand the collective progress, and identify any issues that might need attention.