### Standard Operating Procedure (SOP)

**Title**: Converting a Domain Controller into a Global Catalog Server

**Objective**: To enable Global Catalog (GC) services on a Domain Controller (DC) within an Active Directory Domain Services (AD DS) environment.

**Scope**: This SOP is applicable for network administrators responsible for managing Active Directory infrastructure.

**Prerequisites**:

- Ensure you have administrative privileges on the domain controller where you intend to enable the Global Catalog.
- Verify network connectivity and proper functioning of the domain controller.

**Responsibilities**: Network administrators are responsible for the configuration and maintenance of the AD DS environment, including Global Catalog servers.

**Procedure**:

1. **Log into the Domain Controller**:
    
    - Log into the domain controller that you want to designate as a Global Catalog server.
2. **Open Active Directory Sites and Services**:
    
    - Click on "Start", type "dssite.msc" into the search box, and press Enter. This opens the Active Directory Sites and Services management console.
3. **Navigate to the Desired Server**:
    
    - In the console tree, expand "Sites", then expand the site where your domain controller is located.
    - Navigate to "Servers", and then expand the server which you intend to make a Global Catalog.
4. **Open NTDS Settings**:
    
    - Right-click on "NTDS Settings" under the chosen server, and select "Properties".
5. **Enable Global Catalog**:
    
    - In the Properties dialog box, find the "Global Catalog" checkbox.
    - Check the "Global Catalog" box to enable GC on this domain controller.
    - Click "OK" to apply the changes.
6. **Replication**:
    
    - After enabling GC, the domain controller will start replicating the partial attribute set for all objects in the forest.
    - The time this takes will depend on the size of the AD DS environment and network bandwidth.
7. **Verification**:
    
    - After the replication completes, verify the Global Catalog functionality.
    - In the "Active Directory Sites and Services" window, right-click the domain controller, and then click "Replicate Now" to ensure immediate replication.
    - You can also use tools like "Repadmin" for more detailed verification.
8. **Monitor Performance**:
    
    - Monitor the performance of the new Global Catalog server, especially in the initial stages, to ensure it is functioning correctly and efficiently.
9. **Documentation**:
    
    - Document the change in your network configuration, including the date and details of the server that was configured as a Global Catalog.
    - Record any performance or configuration issues encountered and resolved.
10. **Inform Stakeholders**:
    

- Notify relevant team members and stakeholders about the change, especially if it impacts specific network operations or applications.

**End of Procedure**.

**Notes**:

- Enabling a Global Catalog on a domain controller can impact its performance due to the increased load of storing and replicating additional data.
- Ensure that you have sufficient network and server resources to handle the additional load.
- The Global Catalog plays a critical role in user authentication and directory searches across domains, so consider the placement and number of GCs in your network for redundancy and performance.