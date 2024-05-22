This guide outlines how to adjust network settings for Amazon EC2 instances running Windows. It includes steps for adding a secondary IP address, either from a secondary Elastic Network Interface (ENI) or directly to the primary ENI, and details on configuring the default gateway and DNS servers.

### AWS Management Console Configuration

#### Removing a Secondary Network Interface (If Applicable)

1. **Navigate to the EC2 Dashboard** within the AWS Management Console.
2. Click on **Network Interfaces** under **Network & Security**.
3. Identify the network interface to remove by its IP address or attached instance ID.
4. **Detach** the interface by selecting it, clicking **Actions**, and choosing **Detach**. Confirm the action.
5. **Delete** the network interface if no longer needed by selecting **Delete** from the **Actions** menu.

#### Assigning a Secondary IP Address

##### When the IP is on a Secondary ENI

1. Locate the secondary ENI in the **Network Interfaces** section.
2. Click on **Actions** and select **Manage IP Addresses**.
3. Choose **Assign new IP** to add the IP address to the ENI.
4. Save your changes.

##### When the IP is Not on a Secondary ENI

1. Find your primary network interface by its primary IP in the **Network Interfaces** section.
2. Click **Actions**, then **Manage IP Addresses**.
3. Select **Assign new IP** and input the secondary IP address you wish to assign.
4. Confirm by saving the changes.

### Windows Configuration

#### Adding a Secondary IP Address

1. Use Remote Desktop to connect to your EC2 instance.
2. Open **Control Panel > Network and Internet > Network and Sharing Center > Change adapter settings**.
3. Right-click on the connection (likely "Ethernet") and choose **Properties**.
4. Select **Internet Protocol Version 4 (TCP/IPv4)**, click **Properties**, then **Advanced**.
5. Under **IP addresses**, click **Add** to input the secondary IP address and subnet mask.
6. Click **Add**, then **OK** to apply.

### Determining and Configuring Network Settings

#### Default Gateway and DNS Servers

1. **Open Command Prompt or PowerShell**.
2. Run `ipconfig` to display the current network configuration.
3. Identify the **Default Gateway** and **DNS Servers** for your adapter.

#### Configuring DNS Servers

1. Access your network connection's properties again via **Control Panel**.
2. Choose **Internet Protocol Version 4 (TCP/IPv4)** or **Version 6 (TCP/IPv6)** and select **Properties**.
3. At the bottom, either select to automatically obtain DNS server addresses or enter them manually.

### Finalizing Configuration

- **Connectivity Test**: Conduct a ping test to the new secondary IP to ensure it's reachable.
- **Instance Reboot**: Reboot the instance to ensure all network changes are fully implemented.