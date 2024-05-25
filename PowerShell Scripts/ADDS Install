# Function to check and correct necessary privileges
function Ensure-Privileges {
    $principal = [System.Security.Principal.WindowsPrincipal][System.Security.Principal.WindowsIdentity]::GetCurrent()
    if (-not $principal.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator)) {
        Write-Host "This script needs to be run as an administrator." -ForegroundColor Red
        Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
        exit
    }
}

# Ensure necessary privileges
Ensure-Privileges

# Ask whether it is a new domain or an existing domain
$newDomain = Read-Host "Is this a new domain? (yes/no)"

# Ask for the domain name
$domainName = Read-Host "Enter the domain name (e.g., example.com)"

# Ask for the secure password
$safeModeAdminPassword = Read-Host "Enter the Safe Mode Administrator Password" -AsSecureString

# Install the AD DS role
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

# Import the ADDSDeployment module
Import-Module ADDSDeployment

# Determine the domain setup
if ($newDomain -eq 'yes') {
    # For a new domain
    $domainNetBIOSName = $domainName.Split('.')[0].ToUpper()
    Install-ADDSForest -DomainName $domainName `
                       -SafeModeAdministratorPassword $safeModeAdminPassword `
                       -DomainNetBIOSName $domainNetBIOSName `
                       -InstallDns `
                       -CreateDnsDelegation:$false `
                       -DatabasePath "C:\Windows\NTDS" `
                       -LogPath "C:\Windows\NTDS" `
                       -SysvolPath "C:\Windows\NTDS" `
                       -Force:$true
} else {
    # For an existing domain
    Install-ADDSDomainController -DomainName $domainName `
                                 -SafeModeAdministratorPassword $safeModeAdminPassword `
                                 -InstallDns `
                                 -CreateDnsDelegation:$false `
                                 -DatabasePath "C:\Windows\NTDS" `
                                 -LogPath "C:\Windows\NTDS" `
                                 -SysvolPath "C:\Windows\NTDS" `
                                 -Force:$true
}

Write-Host "AD DS installation process completed." -ForegroundColor Green
