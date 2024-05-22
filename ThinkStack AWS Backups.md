The ThinkStack AWS Backup Terraform module sets up a comprehensive backup strategy using AWS services, specifically focusing on KMS (Key Management Service) for encryption, IAM (Identity and Access Management) for permissions, and AWS Backup for the actual backup operations. Here's an explanation of how these backups work, including their schedule and lifecycle:

### KMS Encryption Key

- **Production and Disaster Recovery (DR) Keys**: Two KMS keys are created, one for the production region (`aws_kms_key.key`) and another for the disaster recovery region (`aws_kms_key.dr_key`). These keys are used to encrypt the backups, ensuring they are secure both at rest and in transit.

### IAM Roles and Policies

- **AWS Backup Role**: An IAM role (`aws_iam_role.backup`) is defined with a policy that allows AWS Backup service to assume this role. This role is attached with two policies (`aws_iam_role_policy_attachment.backup` and `aws_iam_role_policy_attachment.restores`) that grant necessary permissions for backup and restore operations.

### Backup Vaults

- **Vaults for Different Frequencies**: Four backup vaults are created for storing backups with different frequencies: hourly (`aws_backup_vault.vault_prod_hourly`), daily (`aws_backup_vault.vault_prod_daily`), monthly (`aws_backup_vault.vault_prod_monthly`), and one for disaster recovery (`aws_backup_vault.vault_disaster_recovery`). Each vault is encrypted using the respective KMS key.

### Backup Vault Policies

- **Deny Delete Policies**: Policies are attached to each backup vault to deny delete operations on the vault and the recovery points. This is a security measure to prevent accidental or malicious deletions of backups.

### Backup Vault Lock Configuration

- **Immutable Backup Configurations**: Vault lock configurations are set for the hourly, daily, monthly, and disaster recovery vaults. These configurations make the backups immutable for a specified number of days (`changeable_for_days = 3`), enhancing security by preventing modifications or deletions during this period.

### Backup Plans

- **Primary Backup Plan**: A comprehensive backup plan (`aws_backup_plan.plan`) is created with three rules for hourly, daily, and monthly backups. Each rule specifies the target vault, the schedule (using cron expressions), and the lifecycle of the backups (e.g., how long backups are retained).
    
    - **Hourly backups** are scheduled every hour.
    - **Daily backups** are scheduled at 7:20 AM UTC, with a specific rule for copying these backups to the disaster recovery vault.
    - **Monthly backups** are scheduled for the first day of each month at 7:20 AM UTC.
- **EC2 AMI Backup Plan**: A separate backup plan (`aws_backup_plan.ec2_plan`) is created specifically for EC2 instance backups, with a daily backup schedule at 9:20 AM UTC. This plan includes a rule for copying backups to the disaster recovery vault.

### Lifecycle Management for Backups

Here's a detailed explanation of the lifecycle policy for each type of backup, including the disaster recovery (DR) backups:

#### Hourly Backups

- **Retention Period**: Hourly backups are configured to be retained for **3 days**. After this period, the backups are automatically recycled, meaning older backups beyond 3 days are deleted, and new ones are continuously created every hour. This approach ensures a rolling window of backup coverage for the most recent 72 hours, offering rapid recovery options for very recent data changes or losses.

#### Daily Backups

- **Retention Period**: Daily backups are retained for **30 days**. This retention strategy strikes a balance between having a longer history of backups for more extensive recovery options and managing storage costs effectively. Daily backups older than 30 days are automatically deleted, and new backups are taken daily to ensure ongoing coverage. The same 30-day retention policy applies to **DR backups** created daily, ensuring that the disaster recovery site has a synchronized 30-day window of recoverable backups.

#### Monthly Backups

- **Retention Period**: Monthly backups are stored and recycled every **12 months**. This longer retention period is designed for scenarios requiring long-term data retention, such as compliance with regulatory requirements, historical data analysis, or safeguarding against long-term data corruption issues. After 12 months, older monthly backups are automatically deleted, and new ones are created on a rolling basis, maintaining a comprehensive annual backup history.

#### Disaster Recovery (DR) Backups

- **Creation Frequency and Retention Period**: DR backups are created daily, mirroring the daily backup strategy for the primary site. These backups are specifically aimed at ensuring business continuity in the event of a catastrophic failure at the primary site. The DR backups are retained for **30 days**, aligning with the daily backup retention period. This ensures that the disaster recovery site can provide a recovery point close to the time of any incident affecting the primary site, minimizing data loss and downtime.

### Backup Selections

- **Resource Selections**: Two backup selections are defined:
    - `aws_backup_selection.all_resources` for backing up all resources except EC2 instances and S3 buckets.
    - `aws_backup_selection.all_ec2` specifically targets EC2 instances for backup under the EC2 backup plan.

### Scheduling

- Backups are scheduled using cron expressions, allowing for precise control over the timing of backup jobs. Hourly, daily, and monthly frequencies ensure that data is backed up at regular intervals, minimizing data loss risk.