### Standard Operating Procedure (SOP)

**Title**: Creating and Applying Password Policy via Group Policy Object (GPO) to an Organizational Unit (OU) in ADUC

**Objective**: To establish a password policy for all user accounts within a specified OU in Active Directory.

**Scope**: This SOP applies to network administrators who manage Active Directory.

**Responsibilities**: Network administrators are responsible for implementing this policy.

**Prerequisite Notes**: 

Here are the requirements to use GPMC:

1. **Appropriate Permissions**: You must be a member of the Group Policy Creator Owners group, the Domain Admins group, or the Enterprise Admins group in Active Directory, or you must have been delegated the appropriate authority.
    
2. **Access to GPMC**: GPMC can be run from a workstation or server that is part of the domain, as long as you have access to the domain and sufficient permissions.
    
3. **Network Connectivity**: The workstation or server where you run GPMC must have network connectivity to the domain controller to access and manage the Group Policies.
    
4. **RSAT Installed**: If you are using a workstation, make sure that RSAT is installed and that GPMC is enabled within the RSAT features.

**Procedure**:

1. **Open Group Policy Management**:
    
    - Click on "Start", type “gpmc.msc” in the search box, and press Enter to open the Group Policy Management Console.
2. **Locate the Desired OU**:
    
    - In the Group Policy Management Console, expand the forest and domain containing the OU to which you want to apply the policy.
3. **Create a New GPO**:
    
    - Right-click on the target OU and select “Create a GPO in this domain, and Link it here…”.
    - Enter a name for the new GPO, such as "Password Policy GPO".
4. **Edit the GPO**:
    
    - Right-click the newly created GPO linked to your OU and select “Edit” to open the Group Policy Management Editor.
5. **Navigate to Password Policies**:
    
    - In the Group Policy Management Editor, navigate to `Computer Configuration` → `Policies` → `Windows Settings` → `Security Settings` → `Account Policies` → `Password Policy`.
6. **Configure Password Policies**:
    
    - You will see a list of settings such as `Enforce password history`, `Maximum password age`, `Minimum password age`, `Minimum password length`, `Password must meet complexity requirements`, and `Store passwords using reversible encryption`.
    - Double-click on each setting to configure it according to your requirements.
7. **Example Configuration**:
    
    - `Enforce password history`: 24 passwords remembered.
    - `Maximum password age`: 60 days.
    - `Minimum password age`: 1 day.
    - `Minimum password length`: 8 characters.
    - `Password must meet complexity requirements`: Enabled.
    - `Store passwords using reversible encryption`: Disabled.
8. **Apply and Close Editor**:
    
    - After configuring the settings, close the Group Policy Management Editor. The policy settings will be saved automatically.
9. **Enforce the GPO**:
    
    - Back in the Group Policy Management Console, ensure the new GPO is linked to the correct OU. You can enforce the GPO by right-clicking on it and selecting “Enforce”.
10. **Update Group Policy on Client Computers**:
    
    - To immediately apply the policy, run the `gpupdate /force` command on the client computers, or wait for the next Group Policy refresh cycle.
11. **Documentation**:
    
    - Document the changes made, including the date of implementation and the details of the policy settings.

**Verification**:

- Check the application of the policy by using the `Resultant Set of Policy` (RSoP) snap-in or the `gpresult` command.

**Troubleshooting**:

- If the policy does not apply, verify that:
    - The GPO is linked to the correct OU.
    - The target computers are within the OU.
    - There are no conflicting policies with higher precedence.
    - The group policy inheritance is not blocked.
    - The client computers have network connectivity and can access the domain controller.

**End of Procedure**.