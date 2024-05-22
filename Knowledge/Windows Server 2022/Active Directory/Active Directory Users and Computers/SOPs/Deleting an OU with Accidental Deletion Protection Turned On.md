
### Standard Operating Procedure (SOP)

**Title**: Deleting an Organizational Unit (OU) with Accidental Deletion Protection Enabled

**Objective**: To safely remove an OU from Active Directory Users and Computers (ADUC) which has accidental deletion protection enabled.

**Scope**: This SOP applies to IT administrators who have the necessary permissions to manage and modify Active Directory OUs.

**Prerequisites**:

1. Administrative credentials with permissions to delete OUs in Active Directory.
2. Ensure that the OU to be deleted does not contain any objects that are required, as deletion will remove all contained objects.

**Responsibilities**: IT administrators are responsible for the safe deletion of OUs in ADUC, ensuring that no necessary data is lost.

**Procedure**:

1. **Backup AD Data**:
    
    - Before proceeding with deletion, ensure that you have a current backup of Active Directory. In case of unintended consequences, you can restore from the backup.
2. **Open ADUC**:
    
    - Click "Start", type "dsa.msc" in the search box, and press Enter, or navigate to Administrative Tools and open Active Directory Users and Computers.
3. **Locate the OU**:
    
    - In the ADUC console, navigate through the domain and locate the OU that is to be deleted.
4. **Disable Accidental Deletion Protection**:
    
    - Right-click on the OU you want to delete.
    - Select "Properties" from the context menu.
    - Click on the "Object" tab in the properties window. If you do not see the "Object" tab, ensure "Advanced Features" is enabled in the "View" menu of ADUC.
    - Uncheck the "Protect object from accidental deletion" checkbox.
    - Click "OK" to apply the changes.
5. **Delete the OU**:
    
    - Right-click on the OU again after disabling accidental deletion protection.
    - Click "Delete" from the context menu.
    - You will receive a prompt asking if you are sure you want to delete the OU and all its contents. Confirm the deletion.
6. **Confirm Deletion**:
    
    - After deletion, refresh the view in ADUC to ensure the OU has been removed.
    - If necessary, confirm that the OU is not present by searching for it in the ADUC console.
7. **Documentation**:
    
    - Document the OU deletion, including the name of the OU, the date and time of the deletion, and the name of the administrator who performed the deletion.
8. **Inform Stakeholders**:
    
    - Notify any stakeholders or departments that were associated with the OU of its deletion.
9. **Post-Deletion Audit**:
    
    - Perform an audit to ensure that the deletion has not affected any other unrelated parts of the directory.
    - Verify that any associated group policies are no longer in effect or have been reassigned as necessary.
10. **Review Backup and Restore Procedures**:
    
    - Review and update your AD backup and restore procedures if necessary to reflect the changes made.

**End of Procedure**.