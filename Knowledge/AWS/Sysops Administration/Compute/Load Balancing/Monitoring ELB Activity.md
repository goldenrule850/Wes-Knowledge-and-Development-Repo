### Monitoring ELB Activity: Service Options and Their Effectiveness

#### Scenario Brief:

A company utilizing an Application Load Balancer (ALB) to manage traffic to EC2 instances experienced downtime due to unintended changes made by a Junior DevOps Engineer. To prevent such incidents, there's a need to monitor activities and changes to AWS resources, specifically focusing on the ALB.

#### Services for Capturing ELB Activity:

1. **ELB Access Logs**:
    
    - Provides detailed records of requests sent to the ALB, including client IP, request paths, and server responses. While useful for traffic analysis and debugging, access logs primarily capture the data flow rather than configuration changes.
2. **ELB API Calls with CloudTrail**:
    
    - Tracks API calls made to the ALB, including configuration changes, by logging who made the call, the source IP, and the specifics of the change. This service is crucial for auditing and identifying unauthorized or accidental modifications to ELB settings.
3. **ELB Health Checks**:
    
    - Automated tests performed by the ALB on target instances to ensure they can handle requests. Health checks are vital for operational integrity but do not log or monitor configuration changes or user activities on the ELB itself.
4. **CloudWatch Metrics**:
    
    - Offers metrics related to the ELB's performance, such as request count, latency, and HTTP codes. These metrics are instrumental in monitoring the operational health of the ELB but do not directly track configuration changes or user activities.

#### Identifying the Non-relevant Service:

**ELB Health Checks** is the correct answer as the service not helpful for capturing monitoring information about ELB activity concerning configuration changes or operational modifications made by users. Health checks focus on the availability and responsiveness of the instances behind the ALB, ensuring traffic is correctly routed to healthy instances. They do not provide logs or insights into the modifications made to the ALB settings, making them ineffective for the specific need to monitor and prevent unauthorized changes.

#### Analysis of Other Options:

- **ELB Access Logs** are relevant for analyzing traffic patterns and troubleshooting application-level issues but do not directly track configuration changes. However, they can indirectly indicate operational impacts resulting from configuration modifications.
    
- **ELB API Calls with CloudTrail** is highly effective for capturing detailed information about configuration changes made to the ALB, making it essential for auditing and security monitoring purposes.
    
- **CloudWatch Metrics** are crucial for operational monitoring and performance analysis but do not capture the specifics of configuration changes or user activities related to the ALB's setup and modification.