
This is a PowerShell script that will prompt you to choose a network adapter from the list of available adapters and then enter the primary and secondary DNS server IP addresses. It will then set the DNS server addresses for the selected network adapter.

```powershell
# Get all network adapters and output them in a list with an index
$adapters = Get-NetAdapter | Where-Object { $_.Status -eq "Up" }
$adapters | ForEach-Object { $index = 0 } { $_ | Select-Object @{Name="Index"; Expression={ $script:index }}, Name, InterfaceDescription; $script:index++ }

# Prompt the user to select the network adapter by index
$selectedIndex = Read-Host "Please enter the index of the network adapter you want to configure"
$selectedAdapter = $adapters[$selectedIndex]

# Check if user selected a valid adapter index
if ($selectedAdapter -eq $null) {
    Write-Host "Invalid selection. Exiting script."
    exit
}

# Prompt the user for the primary and secondary DNS IP addresses
$primaryDns = Read-Host "Please enter the primary DNS IP address (e.g., 8.8.8.8)"
$secondaryDns = Read-Host "Please enter the secondary DNS IP address (Leave blank if none)"

# Set DNS server addresses, if secondary DNS is not provided, it will be ignored
$dnsAddresses = @($primaryDns)
if ($secondaryDns) {
    $dnsAddresses += $secondaryDns
}

# Apply DNS server addresses to the selected network adapter
Set-DnsClientServerAddress -InterfaceAlias $selectedAdapter.Name -ServerAddresses $dnsAddresses

# Verify and show the new DNS settings
$confirmation = Get-DnsClientServerAddress -InterfaceAlias $selectedAdapter.Name
Write-Host "DNS settings applied to interface $($selectedAdapter.Name):"
$confirmation | Select-Object -Property InterfaceAlias,ServerAddresses
```





