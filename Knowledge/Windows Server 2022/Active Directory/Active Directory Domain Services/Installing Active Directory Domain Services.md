To install Active Directory Domain Services (AD DS) on a fresh Windows Server 2022 machine, follow these steps:

### Steps

#### Step 1: Setting Up the Server

1. **Log in to your server** with an account that has administrative privileges.
2. **Set a static IP address** on the server to ensure that the server will maintain the same IP address, which is important for other devices on the network to reliably find and connect to it.
3. **Rename the server** (optional) to a meaningful name that follows your organization's naming conventions.
4. **Update the server** with the latest security patches and updates from Microsoft.

#### Step 2: Installing AD DS Role

1. **Open Server Manager**, which will start by default when you log in. If you've closed it, you can open it from the Start menu.
2. **Select 'Add roles and features'** from the 'Manage' menu or from the 'Quick Start' section.
3. **Click 'Next'** on the 'Before you begin' page if it appears.
4. On the 'Select installation type' page, **choose 'Role-based or feature-based installation'** and click 'Next'.
5. On the 'Select destination server' page, **ensure that your server is selected** and click 'Next'.
6. On the 'Select server roles' page, **check the box for 'Active Directory Domain Services'**. A window will pop up to add features that are required for AD DS; **click 'Add Features'**.
7. **Click 'Next'** without selecting any additional features unless you know you need them.
8. **Click 'Next'** through the AD DS and DNS Server pages if they appear.
9. On the 'Confirmation' page, you can choose to **automatically restart the server if required** by checking the corresponding box. Then, **click 'Install'**.
10. Once the installation is complete, click 'Close'.

#### Step 3: Promoting the Server to a Domain Controller

After installing the AD DS role, you need to promote the server to a domain controller.

1. **Click on the 'Promote this server to a domain controller'** link, which appears on the Results page of the Server Manager after AD DS installation.
2. On the 'Deployment Configuration' page, you can choose to **add the server to an existing domain or create a new domain**. For a new forest, select 'Add a new forest' and type the Root domain name (e.g., "company.local").
3. **Click 'Next'**.
4. On the 'Domain Controller Options' page, set the Forest and Domain functional levels according to your environment (typically, you would choose the highest level that supports all domain controllers in your environment). Choose a password for the Directory Services Restore Mode (DSRM); this password is critical, so be sure to remember it.
5. **Click 'Next'** through the DNS Options, Additional Options, Paths, and Review Options pages, confirming the selections you made.
6. On the 'Prerequisites Check' page, ensure that all checks complete successfully, then **click 'Install'**.
7. The server will automatically reboot after the installation process completes.

#### Step 4: Verifying the Installation

After the server restarts:

1. **Log in** to the server with the domain administrator credentials you created during the promotion process.
2. **Open Server Manager** and click on the 'Tools' menu to verify that 'Active Directory Users and Computers' and 'Active Directory Domains and Trusts' are listed, indicating a successful installation.

### Functional Levels

Active Directory functional levels determine the available Active Directory Domain Services (AD DS) domain or forest capabilities. They are defined by the lowest Windows Server operating system version on the domain controllers within the domain or forest. Raising the functional level can enable advanced AD DS features, but it also means that you cannot add domain controllers that run earlier versions of Windows Server than the functional level you have set.

#### Domain Functional Levels

The domain functional level affects the capabilities of domain controllers within a single domain:

- **Windows Server 2008**: Supports domain controllers running Windows Server 2008 and higher.
- **Windows Server 2008 R2**: Supports domain controllers running Windows Server 2008 R2 and higher.
- **Windows Server 2012**: Supports domain controllers running Windows Server 2012 and higher.
- **Windows Server 2012 R2**: Supports domain controllers running Windows Server 2012 R2 and higher.
- **Windows Server 2016**: Supports domain controllers running Windows Server 2016 and higher.
- **Windows Server 2019**: Supports domain controllers running Windows Server 2019 and higher.
- **Windows Server 2022**: Supports domain controllers running Windows Server 2022.

Each level introduces new AD DS features that were not available in previous versions, such as improved replication and authentication mechanisms, advanced group managed service accounts, and other security and performance improvements.

#### Forest Functional Levels

The forest functional level determines the capabilities across all domains within the forest:

- **Windows Server 2008**: Allows for advanced features such as the Read-only Domain Controller (RODC) and improved AD DS auditing.
- **Windows Server 2008 R2**: Introduces features such as the Active Directory Recycle Bin, which allows for the restoration of deleted AD DS objects.
- **Windows Server 2012**: Adds support for features like cloning virtual domain controllers and dynamic access control.
- **Windows Server 2012 R2**: Provides additional features such as the ability to protect from accidental deletions using Authentication Policies and Policy Silos.
- **Windows Server 2016**: Introduces features such as Privileged Access Management (PAM) using Microsoft Identity Manager (MIM).
- **Windows Server 2019**: Enhancements and new capabilities, including security improvements, are added to the AD DS.
- **Windows Server 2022**: Further improvements and new features, which could include security enhancements and other optimizations for cloud integration.

#### Considerations for Functional Levels

- **Backward Compatibility**: When you raise the functional level, you lose the ability to include domain controllers running older versions of Windows Server than the minimum level required.
- **Irreversible Action**: Once you raise the functional or domain functional level, you cannot lower it back down (except in certain cases during a limited time after the upgrade, and only if certain conditions are met).
- **Features vs. Compatibility**: Choosing a functional level is a balance between enabling new features and maintaining compatibility with older domain controllers.
- **Preparation**: Ensure all domain controllers in the environment are running the Windows Server version that corresponds to the desired functional level before attempting to make this change.

