```powershell
# PowerShell Script to Gather Various System Information

# Initialize output string
$output = @()

# 1. List the hostname of the computer
$hostname = $env:COMPUTERNAME
$output += "Hostname of the computer: $hostname"

# 2. List the time the script was executed
$currentDateTime = Get-Date
$output += "Time the script was executed: $currentDateTime"

# 3. Get the time 30 minutes ago
$time30MinutesAgo = (Get-Date).AddMinutes(-30)
$output += "Time 30 minutes ago: $time30MinutesAgo"

# 4. Check if there are any critical error logs from the last 30 minutes
$criticalErrors = Get-WinEvent -FilterHashtable @{LogName='System'; Level=1; StartTime=$time30MinutesAgo} -ErrorAction SilentlyContinue

if ($criticalErrors.Count -gt 0) {
    $output += "Critical errors in the last 30 minutes: $($criticalErrors.Count)"
    $errorMessages = $criticalErrors | ForEach-Object { $_.Message }
    $output += $errorMessages
} else {
    $output += "No critical errors in the last 30 minutes."
}

# 5. Create a list of actively running services
$runningServices = Get-Service | Where-Object {$_.Status -eq 'Running'}
$serviceList = $runningServices | ForEach-Object { "$($_.ServiceName) - $($_.DisplayName)" }
$output += "List of actively running services:"
$output += $serviceList

# Output the accumulated data to a text file on the desktop named after the hostname
$outputPath = "$env:USERPROFILE\Desktop\$hostname.txt"
$output -join "`n`n" | Out-File $outputPath
```

