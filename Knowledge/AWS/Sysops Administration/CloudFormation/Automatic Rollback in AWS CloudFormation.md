### Implementing Automatic Rollback in AWS CloudFormation for Failed Stacks

#### Scenario Brief:

A SysOps Administrator is tasked with creating a CloudFormation template for an application stack that has specific prerequisites. These prerequisites must be installed before the application can run properly, a process that could take up to an hour. The requirement is for the stack to automatically rollback if it fails to launch completely.

#### Solutions:

1. **ResourceSignal in Conditions Resource Attribute**:
    
    - **Usage**: Typically, the `Conditions` resource attribute in a CloudFormation template is used to define conditions that control whether certain resources are created or not. It doesn't directly handle timeouts or signals related to resource creation or failures.
2. **ResourceSignal in CreationPolicy Resource Attribute**:
    
    - **Purpose**: The `CreationPolicy` attribute is used to prevent a resource's status from being set to create complete until CloudFormation receives a specified number of success signals or until a timeout period passes.
    - **Implementation**:
        - **`ResourceSignal` Parameter**: Within the `CreationPolicy`, the `ResourceSignal` parameter is crucial for managing how CloudFormation responds to resource creation signals.
        - **`Timeout` Property**: By adding a `Timeout` property with a value of 2 hours, the administrator sets a window during which CloudFormation expects to receive a signal that the resource has been successfully created.
    - **Benefits**:
        - Ensures that prerequisite packages and configurations have sufficient time to be installed and initialized before marking the stack creation as successful.
        - Automatically triggers a stack rollback if the timeout is reached without receiving a success signal, mitigating the impact of a failed deployment.

#### Why "ResourceSignal in CreationPolicy" Is the Correct Solution:

- **Focused on Resource Creation**: The `CreationPolicy` attribute, specifically with its `ResourceSignal` parameter, is designed to handle scenarios where resources have complex initialization processes. It ensures resources are fully operational before proceeding with the stack creation process.
    
- **Automatic Rollback on Timeout**: If the entire stack fails to launch and the specified timeout period is exceeded without receiving the necessary success signals, CloudFormation automatically triggers a rollback. This is exactly what's needed to address the scenario where the application stack requires prerequisite packages to be installed, which could take a significant amount of time.
    
- **Customizable Wait Time**: Setting the `Timeout` property to 2 hours gives the stack a generous window to complete all necessary installations and configurations, accommodating the lengthy setup time without prematurely marking the stack as failed.