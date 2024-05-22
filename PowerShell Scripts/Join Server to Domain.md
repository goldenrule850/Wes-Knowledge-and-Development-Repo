```powershell
# Load required modules
Add-WindowsCapability -Online -Name Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0

# Prompt user for domain details
$domain = Read-Host -Prompt "Enter domain"
$username = Read-Host -Prompt "Enter username"
$password = Read-Host -Prompt "Enter password" -AsSecureString

# Create credentials object
$credential = New-Object System.Management.Automation.PSCredential("$domain\$username", $password)

# Join the domain
try {
    Add-Computer -DomainName $domain -Credential $credential
    Write-Host "The server has successfully joined the domain."
} catch {
    Write-Host "The server was unable to join the domain. Error: $_"
}

# Prompt user for reboot
$reboot = Read-Host -Prompt "Would you like to reboot the server now? (yes/no)"

if ($reboot -eq "yes") {
    Restart-Computer -Force
} else {
    Write-Host "The changes won't take effect until the server is rebooted."
}
```

```powershell

########### CHECK HOSTNAME / DOMAIN #############################
$domain = (Get-WmiObject Win32_ComputerSystem).Domain
$hostname = $env:COMPUTERNAME

Write-Output "Domain: $domain"
Write-Output "Hostname: $hostname"

```
