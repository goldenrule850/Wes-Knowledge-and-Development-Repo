```powershell
# Prompt user for new hostname
$newHostname = Read-Host -Prompt "Enter new hostname"

# Change hostname
try {
    Rename-Computer -NewName $newHostname -Force
    Write-Host "Hostname changed successfully to $newHostname."
} catch {
    Write-Host "There was an error changing the hostname. Error: $_"
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

############################################
# Check hostname after finishing and rebooting
############################################

$env:computername
```
