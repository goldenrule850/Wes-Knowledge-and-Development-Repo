### Resolving SSM Agent Issues in AWS for cloned EC2 instances

#### Introduction

When launching cloned instances from AMIs, you might encounter an issue where the SSM agent is not running. This is typically because the cloned instance retains identification and internal networking information, which may not align with the new instance's networking configuration, especially if launched in a different subnet.

#### Objective

To troubleshoot and fix the issue with the SSM agent on cloned AWS instances.

#### Requirements

- Administrative access to the AWS EC2 instances
- PowerShell for Windows Server 2016 or later
- EC2Config service for Windows Server 2012 R2 and earlier

#### Procedure

---

#### Step 1: Adjusting Networking Configuration

Based on your Windows Server version, follow the respective steps:

**For Windows Server 2012 R2 and Earlier:**

1. Connect to your EC2 instance using your preferred method (e.g., RDP).
2. Open the Services management console by pressing `Win + R`, typing `services.msc`, and hitting Enter.
3. Locate the **EC2Config** service, right-click it, and select **Restart**.
4. This action will apply the necessary route to the instance, aligning the networking configuration.

**For Windows Server 2016 or Later:**

1. Connect to your EC2 instance via RDP or your preferred method.
2. Open an elevated PowerShell window by searching for PowerShell, right-clicking on it, and selecting **Run as administrator**.
3. Run the following command:

```powershell
Import-Module c:\ProgramData\Amazon\EC2-Windows\Launch\Module\Ec2Launch.psm1 ; Add-Routes
```

4. This command adjusts the instance's networking routes to accommodate the new environment.

For further details and troubleshooting steps, refer to the [AWS Knowledge Center](https://repost.aws/knowledge-center/waiting-for-metadata).

---

#### Step 2: Running SSM Diagnostics

If the SSM agent is still not operational after adjusting the networking configuration, follow these steps to run SSM diagnostics:

1. Connect to your EC2 instance using RDP or another method.
2. Open PowerShell with administrative privileges.
3. Navigate to the SSM directory by executing:

```powershell
cd "C:\Program Files\Amazon\SSM"
```

4. Run the SSM diagnostics command:

```powershell
.\ssm-cli.exe get-diagnostics --output table
```

5. Review the output table for any errors or issues and take the necessary corrective actions.

#### Conclusion

By following these steps, you should be able to resolve issues related to the SSM agent not running on cloned AWS instances. Ensure to check for any specific errors during the diagnostics and address them accordingly. If problems persist, consider contacting AWS Support for further assistance.