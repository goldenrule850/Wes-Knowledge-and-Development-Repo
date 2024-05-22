AWS Shield is a managed Distributed Denial of Service (DDoS) protection service that safeguards applications running on AWS. AWS Shield provides always-on detection and automatic inline mitigations that minimize application downtime and latency, so there's no need to engage AWS Support to benefit from DDoS protection.

There are two tiers of AWS Shield:

1. **AWS Shield Standard:**
    
    - Automatically included with AWS services at no additional cost.
    - Provides protection from attacks commonly seen for websites and applications, like SYN/UDP floods, reflection attacks, and other layer 3/layer 4 attack vectors.
2. **AWS Shield Advanced:**
    
    - Provides enhanced protections for web applications with higher risk profiles.
    - Offers additional mitigation capacity and capabilities against more sophisticated and larger scale DDoS attacks, along with 24/7 access to the AWS DDoS Response Team (DRT) and financial protection against DDoS-related spikes in your AWS bill.

### How AWS Shield Works

1. **Always-On Traffic Monitoring:**
    
    - AWS Shield continuously monitors traffic to detect patterns indicative of DDoS attacks.
2. **Automatic Mitigations:**
    
    - When a potential DDoS attack is detected, AWS Shield automatically applies mitigations in real-time, aiming to maintain the performance and availability of your application.
3. **Integration with AWS Services:**
    
    - AWS Shield is integrated with other AWS services like Amazon CloudFront, Elastic Load Balancing (ELB), Amazon Route 53, and Amazon Global Accelerator, providing a seamless experience to safeguard your applications.
4. **Visibility and Reporting:**
    
    - AWS Shield Advanced provides attack diagnostics and visibility via AWS WAF and AWS CloudWatch, giving insights into the attacks and the applied mitigations.

#### Use Cases for AWS Shield

1. **Website and Application Protection:**
    
    - Any business hosting their websites or applications on AWS can utilize AWS Shield Standard for basic protection against common DDoS attacks.
2. **Advanced Security for High-Risk Applications:**
    
    - Enterprises with high-profile and mission-critical applications may opt for AWS Shield Advanced to protect against larger and more sophisticated attacks.
3. **Compliance Requirements:**
    
    - Organizations that are required to maintain certain security standards and protections as part of regulatory compliance can leverage AWS Shield as part of their security posture.
4. **Financial Safeguards:**
    
    - AWS Shield Advanced provides cost protection by absorbing the scaling costs associated with DDoS attack traffic spikes, preventing unexpected increases in your AWS bill due to scaling your AWS resources to handle attack traffic.
5. **Real-Time Gaming and Live Streaming:**
    
    - For applications that require real-time user experiences, such as online gaming and live streaming, AWS Shield helps ensure uninterrupted service during DDoS attack events.
6. **E-commerce Platforms:**
    
    - During high-traffic events like sales or product launches, AWS Shield can protect e-commerce platforms from DDoS attacks aimed at disrupting operations or degrading user experience.

### Types of Common DDoS Attacks

DDoS (Distributed Denial of Service) attacks are malicious attempts to disrupt normal traffic of a targeted server, service, or network by overwhelming the target or its surrounding infrastructure with a flood of Internet traffic.

#### 1. Network Volumetric Attacks

- **Description:** These are the most common types of DDoS attacks. They attempt to consume the bandwidth within the targeted network or service.
- **How it Works:**
    - Attackers generate large volumes of data packets and send them to the target.
    - The goal is to saturate the bandwidth of the victim's network, making it unresponsive to legitimate traffic.
- **Examples:**
    - **UDP Flood:** The attacker sends a large number of User Datagram Protocol (UDP) packets to random ports on the victim's system.
    - **ICMP (Ping) Flood:** The network is overwhelmed with ICMP Echo Request (ping) packets, typically resulting in response delays.
- **Mitigation:**
    - Blackhole routing where traffic is directed to a null route and cannot reach the server.
    - Rate limiting to control the traffic.
    - Using scrubbing centers to filter out malicious packets.

#### 2. Network Protocol Attacks

- **Description:** These attacks exploit weaknesses in the layer 3 and layer 4 protocol stack to overwhelm targeted resources with malformed packets.
- **How it Works:**
    - By exploiting protocol weaknesses, these attacks can consume computational resources such as load balancers, firewalls, and application servers, or exhaust state tables in network infrastructure devices.
- **Examples:**
    - **SYN Flood:** Attackers send a succession of SYN requests to a target's system in an attempt to consume enough server resources to make the system unresponsive to legitimate traffic.
    - **Smurf Attack:** Exploits Internet Control Message Protocol (ICMP) and IP broadcast addressing to cause a network to amplify the traffic to the network's broadcast IP address.
- **Mitigation:**
    - SYN cookies can be used to handle SYN-ACK responses.
    - Increasing the capacity of the firewall and other infrastructure to handle more sessions.
    - Implementing anti-spoofing measures to block packets with a forged source IP address.

#### 3. Application Layer Attacks

- **Description:** These are sophisticated, stealthy attacks meant to target applications directly and are often difficult to detect and mitigate.
- **How it Works:**
    - The attackers target the application layer of the OSI model where web pages are generated on the server and delivered in response to HTTP requests.
    - They mimic legitimate user behavior and can deplete application resources, resulting in denial of legitimate user access.
- **Examples:**
    - **HTTP Flood:** A type of attack where an attacker exploits seemingly legitimate HTTP GET or POST requests to attack a web server or application.
    - **Slowloris:** Holds connections open by sending partial requests and periodically sending HTTP headers, but never completing the request.
- **Mitigation:**
    - Rate-based and behavior-based heuristics to identify and block suspicious traffic.
    - Web Application Firewalls (WAFs) to inspect individual HTTP requests and filter out malicious ones.
    - Anomaly detection models to identify deviations from normal traffic patterns.

### AWS Shield Standard: DDoS Protection

AWS Shield Standard is a DDoS protection service that is included at no extra cost for all AWS customers. This service is designed to protect your AWS environment against the most common types of network and transport layer DDoS attacks.

#### Features of AWS Shield Standard

1. **Complimentary Service:**
    
    - It is automatically enabled for every AWS customer, providing basic protection against network and transport layer DDoS attacks without any additional charges.
2. **Perimeter Protection:**
    
    - AWS Shield Standard is designed to offer protection at the perimeter of your AWS environment. This means that it helps to shield your AWS infrastructure from external threats before they can impact your resources.
3. **Protection Scope:**
    
    - The service is designed to protect resources at the regional level, such as instances within your VPC, and also extends to the AWS edge network. This dual-scope approach ensures a broad coverage against attacks.
4. **Defense Against Common Attacks:**
    
    - AWS Shield Standard safeguards against common DDoS attack vectors, including those targeting the network (Layer 3) and transport (Layer 4) layers. Examples include SYN/UDP floods and other related types of DDoS attacks.
5. **Optimized for AWS Services:**
    
    - The service provides the best protection when used in conjunction with other AWS services such as Amazon Route 53, Amazon CloudFront, and AWS Global Accelerator. These services benefit from AWS Shield Standard's protection due to their integration with the AWS network's edge locations.

#### Use Cases for AWS Shield Standard

- **Web Applications:** Protects web applications hosted on AWS from DDoS attacks that could otherwise take them offline or degrade their performance.
- **DNS Services:** Works with Amazon Route 53 to safeguard your domain's resolution process from DDoS attacks that target DNS services.
- **Content Delivery:** Integrates with Amazon CloudFront to protect distributed content from DDoS attacks, ensuring that your content remains available and delivers low latency for global users.
- **Performance Acceleration:** When used with AWS Global Accelerator, AWS Shield Standard helps maintain the performance and availability of your internet-facing applications in the face of DDoS attacks.

### AWS Shield Advanced: Enhanced DDoS Protection

AWS Shield Advanced offers expanded protection for AWS services against Distributed Denial of Service (DDoS) attacks, providing additional features beyond the basic coverage of AWS Shield Standard.

#### Pricing and Commitment

- **Cost:** AWS Shield Advanced is priced at $3,000 per month for each organization.
- **Commitment:** There is a minimum one-year commitment, plus additional charges for data transfer out of AWS per month, which can be significant depending on the extent of the attack and the countermeasures deployed.

#### Protected Services

- AWS Shield Advanced extends protection to several AWS services, including:
    - **CloudFront (CF):** Safeguards your content delivery network to ensure content is continuously available and protected against DDoS attacks.
    - **Route 53 (R53):** Protects your DNS service from being overwhelmed by malicious requests.
    - **Global Accelerator:** Ensures that your applications maintain high performance and availability by protecting the network layer.
    - **Elastic IP Addresses (EIPs):** Shields public IP addresses associated with EC2 instances from being targeted by network attacks.
    - **Application Load Balancers (ALBs), Classic Load Balancers (CLBs), Network Load Balancers (NLBs):** These services distribute incoming application traffic across multiple targets and are protected from DDoS attacks that could compromise their functionality.

#### Activation and Management

- **Manual Activation:** Shield Advanced is not automatically enabled. It must be explicitly activated in your AWS environment.
- **AWS Firewall Manager Integration:** For organizations managing multiple accounts and resources, AWS Shield Advanced can be managed through the AWS Firewall Manager, which simplifies the process of applying protective policies across the entire organization.

#### Financial Safeguards

- **Cost Protection:** AWS Shield Advanced includes cost protection measures, which can help with the financial implications of scaling your AWS services in response to a DDoS attack (such as scaling EC2 instances). This can mitigate the economic impact of an attack, as AWS absorbs some of the cost associated with traffic spikes.

#### Support and Response

- **Proactive Engagement:** In the event of an attack, AWS provides proactive engagement to help you respond and mitigate the attack's effects.
- **AWS Shield Response Team (SRT):** Subscribers to AWS Shield Advanced have 24/7 access to the AWS Shield Response Team, which provides expert guidance and assistance during and after DDoS incidents.

AWS Shield Advanced is also designed to offer higher levels of protection and service for AWS applications, integrating seamlessly with AWS WAF and providing several advanced features:

#### WAF Integration

- **Basic WAF Fees Included:** AWS Shield Advanced covers the costs associated with AWS WAF, including the fees for Web Access Control Lists (ACLs), rules, and the web requests they evaluate.
- **Seamless Operation:** This integration facilitates a cohesive defense strategy that leverages WAF’s application-level inspection capabilities to augment the protection provided by Shield Advanced against DDoS attacks.

#### Application Layer (L7) DDoS Protection

- **Layer 7 Protection:** AWS Shield Advanced provides enhanced DDoS protection at the application layer, which involves inspecting and filtering traffic at the HTTP and HTTPS level.
- **Utilization of WAF:** By using AWS WAF, Shield Advanced can apply rules to inspect the content of web requests and defend against sophisticated attacks targeted at web applications, such as SQL injection and cross-site scripting (XSS).

#### Real-Time Visibility of DDoS Events and Attacks

- **Monitoring:** AWS Shield Advanced offers real-time visibility into DDoS events and attacks, allowing users to monitor and track potential threats as they happen.
- **AWS CloudWatch Integration:** The service integrates with Amazon CloudWatch to provide detailed analytics and alerting, which enables users to respond to and mitigate attacks promptly.

#### Health-Based Detection

- **Proactive Detection:** AWS Shield Advanced uses health checks to provide proactive detection of anomalies and potential DDoS activity by monitoring the health and performance of applications.
- **Application-Specific:** These health checks are tailored to the specifics of your application, ensuring that the detection is relevant and precise.
- **Engagement with SRT:** The AWS Shield Response Team (SRT) uses this health-based detection information to engage proactively with customers during a DDoS event to aid in response and mitigation efforts.

#### Protection Groups

- **Grouping Resources:** AWS Shield Advanced allows users to group their AWS resources into protection groups. This is a logical grouping that can reflect the organization's structure, such as by application layer, deployment stage, or geographic location.
- **Simplified Management:** Protection groups simplify the management of security and protection settings across multiple resources, enabling consistent and efficient application of Shield Advanced protections.