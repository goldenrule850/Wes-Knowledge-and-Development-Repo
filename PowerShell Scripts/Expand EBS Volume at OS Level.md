```powershell
# Function to get drive details
function Get-DriveDetails {
    # Refresh the storage subsystem cache to ensure we have the latest disk information
    Update-HostStorageCache

    $logicalDisks = Get-WmiObject -Class Win32_LogicalDisk | Where-Object { $_.DriveType -eq 3 }

    $drives = $logicalDisks | ForEach-Object {
        $driveLetter = $_.DeviceID[0]
        $size = [math]::Round($_.Size / 1GB, 2)
        $freeSpace = [math]::Round($_.FreeSpace / 1GB, 2)
        $usedSpace = $size - $freeSpace

        $partition = Get-Partition -DriveLetter $driveLetter
        $disk = Get-Disk -Number $partition.DiskNumber
        $diskSize = [math]::Round($disk.Size / 1GB, 2)
        $unusedSpace = $diskSize - $size

        [PSCustomObject]@{
            DriveLetter    = $driveLetter
            TotalSizeGB    = $size
            UsedSpaceGB    = $usedSpace
            FreeSpaceGB    = $freeSpace
            DiskSizeGB     = $diskSize
            UnusedSpaceGB  = $unusedSpace
        }
    }

    $drives | Format-Table -AutoSize
}

# Function to expand a drive partition
function Expand-DrivePartition {
    param (
        [Parameter(Mandatory=$true)]
        [string]$DriveLetter
    )

    try {
        $maxSize = (Get-PartitionSupportedSize -DriveLetter $DriveLetter).SizeMax
        Resize-Partition -DriveLetter $DriveLetter -Size $maxSize
        Write-Host "Drive $DriveLetter expanded successfully!"
        
        # Display the new drive sizes after successful expansion
        Get-DriveDetails
    } catch {
        Write-Host "Failed to expand drive $DriveLetter. Error: $_" -ForegroundColor Red
    }
}

# Display initial drive details
Get-DriveDetails

# Ask user for input
$driveToExpand = Read-Host "Enter the drive letter of the drive you want to expand (e.g. C, D, etc.)"

# Expand the chosen drive
Expand-DrivePartition -DriveLetter $driveToExpand
```

