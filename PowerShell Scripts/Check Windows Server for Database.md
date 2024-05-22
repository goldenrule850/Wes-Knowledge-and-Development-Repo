```powershell
# Define a list of common database service names or patterns
$dbServices = @("MSSQL", "MySQL", "OracleService", "MongoDB", "postgresql-x64-")

# Fetch all services currently running on the server
$allServices = Get-Service

# Check for database services
$foundDbServices = $allServices | Where-Object { $service = $_.Name; $dbServices | ForEach-Object { if ($service -like "*$_*") { $true } } }

# Display the results
if ($foundDbServices.Count -gt 0) {
    Write-Output "Database engines found running on this server:"
    $foundDbServices | ForEach-Object { Write-Output "$($_.DisplayName) - Status: $($_.Status)" }
} else {
    Write-Output "No known database engines were found running on this server."
}
```

