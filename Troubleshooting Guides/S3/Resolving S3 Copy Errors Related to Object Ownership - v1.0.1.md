![[SCR-20240131-eic.png]]

## Problem Statement

When transferring objects from an EC2 instance in one AWS account (Account A) to an S3 bucket in another account (Account B), you may encounter access issues with the objects once they are in the destination bucket. These issues can manifest as inability to view or interact with the objects due to default object ownership settings in S3.

## Symptoms

- Objects copied to the destination S3 bucket are visible but not accessible.
- Attempts to access object ACLs or server-side encryption settings result in permissions errors.
- The AWS Management Console may display errors indicating insufficient permissions to interact with the objects, despite the bucket policy seemingly allowing access.

## Objective

To ensure objects copied to an S3 bucket are fully accessible by the destination bucket owner without permissions errors related to object ownership.

## Prerequisites

- Access to the AWS CLI with necessary credentials on the EC2 instance.
- IAM roles with appropriate permissions in both AWS accounts.
- Bucket ownership settings configured to "Bucket owner preferred".

## Configuring AWS CLI Script

### Step 1: Verify S3 Bucket Ownership Settings

- Confirm that the S3 bucket in Account B has the "Bucket owner preferred" ownership setting enabled. This ensures that the bucket owner automatically gains ownership of uploaded objects.

### Step 2: Apply Correct ACL During Copy

- When using the AWS CLI to copy objects to the destination bucket, append the `--acl bucket-owner-full-control` option. This ACL setting grants the destination bucket owner full permissions to the objects.
#### Example CLI Command Format:
```shell
aws s3 cp [source] [destination] --recursive --acl bucket-owner-full-control
```

- Replace `[source]` with the source directory or bucket and `[destination]` with the destination bucket ARN or URL.

#### Scenario

- **Account A** (Source): AWS Account ID `123456789012`
    - EC2 Instance with files to transfer
- **Account B** (Destination): AWS Account ID `210987654321`
    - S3 Bucket Name: `destination-bucket-for-transfer`

##### Step-by-Step Command

1. **On the EC2 instance in Account A**, you have a directory named `/var/mydata` that contains the files you wish to transfer to Account B.
    
2. **The destination S3 bucket** in Account B is `destination-bucket-for-transfer`.
    
3. **Your objective** is to copy all files from `/var/mydata` on the EC2 instance to the `destination-bucket-for-transfer` S3 bucket in Account B, ensuring that Account B owns the files and has full control over them.

##### AWS CLI Command Example:

```bash
aws s3 cp /var/mydata s3://destination-bucket-for-transfer/mydata --recursive --acl bucket-owner-full-control
```

##### Explanation of the Command

- `aws s3 cp` is the command to copy files from a source to a destination.
- `/var/mydata` is the source directory on the EC2 instance.
- `s3://destination-bucket-for-transfer/mydata` specifies the destination in Account B's S3 bucket, where `mydata` is the directory in the bucket you're copying files to.
- `--recursive` is used to copy files recursively from the source directory, ensuring all subdirectories and files are included.
- `--acl bucket-owner-full-control` sets the Access Control List (ACL) to give the destination bucket owner full control over the copied files, addressing the primary objective of ensuring that Account B has full access and ownership rights to the objects once they are transferred.

### Step 3: Validate Object Accessibility

- Post-copy, check that the destination bucket owner can now access the objects without permission errors.
- In the AWS Management Console, confirm that the 'bucket-owner-full-control' ACL is applied to the new objects.

### Explanation of the Resolution

Using the `--acl bucket-owner-full-control` option aligns the uploaded objects' permissions with the bucket's ownership, circumventing the default S3 behavior where the object uploader retains ownership. This adjustment is crucial for ensuring that the destination account has the necessary permissions to manage and access the objects, resolving the previously encountered accessibility issues.

### Step 4: Additional Troubleshooting

- If accessibility issues persist, review CloudTrail logs for detailed error messages related to the copy operation.
- Check for conflicting IAM policies or bucket policies that may override the intended permissions.

## Cross-Account Access Configuration

Ensuring seamless cross-account access from an EC2 instance in AWS Account A to an S3 bucket in Account B requires precise IAM and bucket policy configurations. The following section provides a comprehensive guide on setting the correct IAM permissions in Account A and configuring the bucket policy in Account B to facilitate this access.

### Account A: IAM Role Permissions

For the EC2 instance in Account A to copy files to the S3 bucket in Account B, the IAM role attached to the EC2 instance must have permissions to put objects into the S3 bucket. Here's an example IAM policy that should be attached to the role in Account A:
#### IAM Policy for EC2 Instance Role in Account A:
```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket",
                "s3:GetObject",
                "s3:PutObject",
                "s3:PutObjectAcl"
            ],
            "Resource": [
                "arn:aws:s3:::destination-bucket-for-transfer",
                "arn:aws:s3:::destination-bucket-for-transfer/*"
            ]
        }
    ]
}
```

### Account B: S3 Bucket Policy

Similarly, the bucket policy in Account B needs to be updated to grant permissions for the `s3:GetObject` action for the IAM role from Account A. Here's the revised bucket policy:

#### S3 Bucket Policy in Account B:

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::123456789012:role/<Account-A-EC2-Role>"
            },
            "Action": [
                "s3:PutObject",
                "s3:PutObjectAcl",
                "s3:GetObject"
            ],
            "Resource": [
                "<arn:aws:s3:::account-b-bucket-for-transfer/*>"
            ]
        }
    ]
}
```

The S3 bucket policy in Account B does not need to be modified for `s3:ListBucket` permissions from Account A's perspective. `s3:ListBucket` is a permission that's applied at the bucket level, and its allowance is typically managed by the IAM role's permissions when accessing a bucket from another account. However, ensuring that the bucket policy does not explicitly deny such actions is crucial. Bucket policies are more about granting or restricting access to the resources within the bucket from various principals.
## Final Verification

- Reaffirm that S3 bucket policies and IAM role permissions are set correctly to allow actions such as `s3:GetObject`.
- Test object accessibility with the destination account's credentials using the AWS Management Console or AWS CLI.
