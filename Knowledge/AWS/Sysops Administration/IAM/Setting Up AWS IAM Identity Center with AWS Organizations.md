### Configuring AWS IAM Identity Center for Centralized Access Management

A Systems Engineer is tasked with the final step of setting up AWS IAM Identity Center for a company that uses AWS Organizations for account consolidation. The setup aims to centrally manage access to all of the company's AWS accounts and applications. A directory has already been created in the master account, and full access is configured in AWS Organizations.

#### Remaining Configuration Steps:

1. **Set up service control policies (SCPs) in AWS Organizations. Associate the SCPs with Directory Service users and groups using the AWS Management Console.**
2. **Set up permission sets in AWS Organizations. Associate the permission sets with AWS IAM Identity Center users and groups.**
3. **For each member account, set up IAM roles that will be used by AWS IAM Identity Center. Associate the users with these IAM roles using AWS IAM Identity Center.**
4. **Set up permission sets in AWS IAM Identity Center to give AWS access to IAM Identity Center Users.**

#### Finalize the Configuration:

To complete the setup of centralized access management, the Engineer must perform the following step:

- **Set up permission sets in AWS IAM Identity Center to give AWS access to IAM Identity Center Users.**

#### Correct Step Explanation:

**Set up permission sets in AWS IAM Identity Center to give AWS access to IAM Identity Center Users.**

- **Direct Management of User Access**: IAM Identity Center permission sets are the tools provided for defining access levels for users and groups to AWS accounts and applications. Since IAM Identity Center is the service intended for access management and the AWS Directory Service is already set up, the next logical action is to create permission sets that dictate what IAM Identity Center users can do in AWS.

#### Incorrect Options and Their Explanations:

1. **SCPs in AWS Organizations**:
    
    - **Incorrect**: SCPs are used to control permissions at the organization level for all AWS accounts under the organization. They are not intended for individual user access management, which is the requirement here.
2. **Permission Sets in AWS Organizations**:
    
    - **Incorrect**: **AWS Organizations does not have a concept of permission sets**; this functionality is specific to IAM Identity Center. SCPs are the right tool within AWS Organizations to manage access, but not at the user level as required.
3. **IAM Roles in Member Accounts**:
    
    - **Incorrect**: While IAM roles are necessary for cross-account access and are used by IAM Identity Center, the setup and association of roles are not performed within AWS Organizations. Roles need to be associated with permission sets within IAM Identity Center, not directly associated with users there.