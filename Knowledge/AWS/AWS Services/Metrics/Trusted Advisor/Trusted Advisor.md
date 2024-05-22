AWS Trusted Advisor is like a personalized cloud consultant that helps you follow AWS best practices. It reviews your AWS environment and provides recommendations to help save money, improve performance, and tighten security. Here’s a simple breakdown:

### What does AWS Trusted Advisor do?

1. **Cost Optimization**: It can identify underused resources or overprovisioned instances, helping you cut down unnecessary costs.
    
2. **Performance**: Trusted Advisor can spot performance bottlenecks, such as underutilized Amazon Elastic Block Store (EBS) volumes or outdated instance types.
    
3. **Security**: It checks for potential security vulnerabilities, like open ports or IAM (Identity and Access Management) issues.
    
4. **Fault Tolerance**: Trusted Advisor reviews the architecture for high availability. For instance, it would notify you if you have all your EC2 instances in a single availability zone.
    
5. **Service Limits**: It checks if you're approaching any of your service usage limits in AWS. This is crucial to prevent unexpected outages or throttling.


### How does it work?

1. **Scans & Analysis**: Trusted Advisor periodically scans your AWS resources and compares their configurations against a set of known AWS best practices.
    
2. **Dashboard**: It provides a dashboard where you can view a summary of your checks, see details on any issues found, and get guidance on how to resolve them.
    
3. **Notifications**: You can receive notifications when new findings are available, ensuring you're always updated on potential issues.


### What does it base its information off of?

AWS Trusted Advisor's recommendations are based on:

1. **AWS Best Practices**: Over the years, AWS has developed a set of best practices based on the experience of serving millions of active customers.
    
2. **Current Configuration**: Trusted Advisor looks at the current state and configuration of your AWS resources.
    
3. **Usage Patterns**: For some checks, Trusted Advisor might analyze the usage pattern of certain resources to provide recommendations. For example, if an EC2 instance has consistently low CPU utilization, Trusted Advisor might suggest downsizing.
    
4. **Service Limit Data**: AWS has predefined limits for many of its services. Trusted Advisor accesses this data to inform you if you're getting close to any of these limits.

### Is AWS Trusted Advisor agent-based?

No, AWS Trusted Advisor is not an agent-based service. You don’t have to install anything on your AWS resources or instances for it to work. Instead, it operates by leveraging AWS APIs to inspect the configuration and utilization of your AWS resources.

### How does it work under the hood?

1. **API Calls**: Trusted Advisor makes API calls to inspect the state and configuration of your resources. This allows it to retrieve necessary details without needing agents.
    
2. **Data Analysis**: Once it gathers this data, Trusted Advisor analyzes it against a predefined set of AWS best practices. These checks and analyses are based on AWS's experience with its vast user base.
    
3. **Result Compilation**: After the analysis, Trusted Advisor compiles the results and presents them in an easily digestible format, categorizing issues based on their severity or potential impact.

## Trusted Advisor Pricing
AWS Trusted Advisor has both free and premium tiers:

### 1. Free Tier:

Trusted Advisor provides a set of core checks that are available to all AWS customers at no additional charge. These core checks cover certain aspects of:

- **Cost Optimization**: Identifying opportunities to save money.
- **Performance**: Ensuring you're getting the best performance out of your AWS resources.
- **Security**: Detecting potential security issues.
- **Fault Tolerance**: Checking redundancy and resilience of your AWS services.
- **Service Limits**: Monitoring if you're approaching or have exceeded AWS service usage limits.

### 2. Business and Enterprise Support Plans:

If you need more comprehensive coverage, AWS offers the full set of Trusted Advisor checks to customers who have signed up for the Business or Enterprise Support plans. With these plans, you get access to:

- **All Trusted Advisor Checks**: This includes many more checks than the free tier, providing a more in-depth analysis of your AWS resources across all categories.
- **API Access**: The ability to access Trusted Advisor programmatically using the AWS Support API.
- **Weekly Email Updates**: Notifications about the status of your AWS environment and any new recommendations.

The cost for Business and Enterprise Support plans is based on a percentage of your AWS monthly usage, with a minimum monthly fee. The exact pricing and percentage can be found on AWS's official pricing page. But as a rough guideline:

- **Business Support Plan**: Starts at the greater of $100 per month or 3% of monthly AWS usage for the first $0–$10K.
- **Enterprise Support Plan**: This is meant for larger enterprises with bigger spends on AWS, and it comes with a dedicated Technical Account Manager (TAM) and Infrastructure Event Management (IEM). The pricing starts at a higher rate and reduces as usage increases.

AWS customers with Basic and Developer support plans get access to a set of seven core Trusted Advisor checks. These core checks cover the following areas:

1. **Service Limits**: This check identifies if you're nearing or have hit the service limits in your AWS account. It's crucial to be aware of these to avoid service disruptions.
    
2. **Security Groups - Specific Ports Unrestricted**: This check looks for security groups that allow unrestricted access (from any IP) to specific, commonly used ports. It helps in identifying potential security risks.
    
3. **IAM Use**: It checks if you are using AWS Identity and Access Management (IAM) to manage permissions, ensuring better security practices.
    
4. **MFA on Root Account**: Checks if Multi-Factor Authentication (MFA) is enabled on the AWS root account. Having MFA on the root account is a recommended security best practice.
    
5. **EBS Public Snapshots**: This check identifies Amazon Elastic Block Store (EBS) snapshots that are publicly accessible. Public snapshots can be a security risk if they contain sensitive information.
    
6. **RDS Public Snapshots**: Like the EBS snapshots check, this one identifies Amazon Relational Database Service (RDS) snapshots that are publicly accessible.
    
7. **S3 Bucket Permissions**: It reviews the permissions on your Amazon S3 buckets and alerts if any bucket has permissions that allow open access, which might lead to unintended data exposure.
  
The Trusted Advisor API provides programmatic access to the functionality offered by AWS Trusted Advisor. By using the Trusted Advisor API, users can automate tasks and integrate Trusted Advisor data with their own systems or third-party applications. Here's a deeper look into the capabilities of this API and how it can be used:

### Capabilities of Trusted Advisor API:

1. **Retrieve Check Results**: You can obtain results of Trusted Advisor checks programmatically, allowing for automated analyses.
    
2. **Refresh Checks**: Instead of manually refreshing checks from the AWS Management Console, you can automate the refresh using the API. This is particularly useful when you want up-to-date results shortly after making changes to your AWS resources.
    
3. **Retrieve Information on Specific Checks**: The API allows you to get details about specific checks, including their category, description, and more.
    
4. **Manage Exclusions**: For certain checks, you might have resources that you want to exclude from the check results. The API allows you to manage these exclusions.
    

### Integrating with Third-Party Services:

The Trusted Advisor API can be a powerful tool when combined with third-party services, applications, or tools. Here's how:

1. **Automated Monitoring Systems**: Integrate Trusted Advisor checks with monitoring solutions or dashboards to get a unified view of your AWS environment's health and security.
    
2. **Notification Systems**: Instead of relying solely on AWS's built-in notifications, you can use the API to create custom alerting mechanisms. For instance, you could automatically send alerts to Slack, Microsoft Teams, or any other communication tool your organization uses.
    
3. **Cost Management Platforms**: Combine Trusted Advisor's cost optimization recommendations with third-party cost management tools for a more holistic cost-saving strategy.
    
4. **Security Information and Event Management (SIEM) Systems**: Integrate Trusted Advisor's security checks with SIEM systems to monitor and respond to potential security threats in real-time.
    
5. **Compliance Tools**: Some organizations use tools to ensure compliance with various standards and regulations. Integrating Trusted Advisor can help these tools provide more accurate and AWS-specific compliance reports.
    
6. **Automation Scripts**: By utilizing the API, you can create scripts that respond automatically to specific Trusted Advisor findings. For example, if Trusted Advisor identifies an open security group, a script could automatically modify the group's permissions to close it.
    

To utilize the Trusted Advisor API with third-party services, you'd typically use AWS SDKs in languages like Python, Java, or JavaScript. You'd make API calls, retrieve the data, and then send this data to the third-party tool, either directly or after some processing.

The Trusted Advisor API is not available to all AWS users by default. To access and utilize the API, you must be subscribed to specific AWS support plans:

1. **Business Support Plan**: This is the tier where most medium to large businesses find value, especially if they require 24/7 access to Cloud Support Engineers. Subscribing to this tier grants full access to the Trusted Advisor API, which means you can programmatically retrieve check results, refresh checks, and manage your Trusted Advisor resources.
    
2. **Enterprise Support Plan**: Aimed at enterprises with sizable AWS operations, this tier not only provides access to the Trusted Advisor API but also offers additional benefits like a dedicated Technical Account Manager (TAM) and Infrastructure Event Management (IEM).
    

It's important to note that the more basic support plans:

- **Basic Support Plan**: This default, free plan does **not** provide access to the Trusted Advisor API. While you can access a limited set of Trusted Advisor checks via the AWS Management Console, you cannot programmatically interact with them.
    
- **Developer Support Plan**: Tailored towards individual developers or smaller startups, this plan also does **not** grant access to the Trusted Advisor API.
    

If you're considering making extensive use of Trusted Advisor, especially in an automated or integrated environment, it's crucial to evaluate and potentially upgrade your AWS support plan to one of the tiers that grant API access. This ensures that you can fully leverage all the capabilities of Trusted Advisor in tandem with other systems or processes you have in place.