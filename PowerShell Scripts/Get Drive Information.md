```powershell
function Get-EBSVolumeId($deviceName) {
    $metadataRoot = "http://169.254.169.254/latest/meta-data/"
    $blockDeviceMapping = "block-device-mapping/"

    try {
        # Request a token for IMDSv2 with a validity of 1 minute (60 seconds)
        $token = Invoke-RestMethod -Method PUT -Headers @{ "X-aws-ec2-metadata-token-ttl-seconds" = "60" } -Uri "$metadataRoot/api/token"

        # Use the token to retrieve the virtual name from the block device mapping
        $virtualName = Invoke-RestMethod -Headers @{ "X-aws-ec2-metadata-token" = $token } -Uri ($metadataRoot + $blockDeviceMapping + $deviceName)

        # Use the token to retrieve the EBS volume ID from the virtual name
        $volumeId = Invoke-RestMethod -Headers @{ "X-aws-ec2-metadata-token" = $token } -Uri ($metadataRoot + "block-device-mapping/" + $virtualName)
        
        return $volumeId
    } catch {
        Write-Host "Error: $_"
        return $null
    }
}

# Get all the physical disks
$physicalDisks = Get-PhysicalDisk

# Iterate through the physical disks and gather information
foreach ($physicalDisk in $physicalDisks) {
    # Get the total drive size
    $totalSize = [math]::Round($physicalDisk.Size / 1GB, 2)

    # Get the device name (like xvdc)
    $deviceName = $physicalDisk.DeviceID

    # Get the EBS Volume ID for the device
    $ebsVolumeId = Get-EBSVolumeId -deviceName $deviceName

    # Get the partitions on this physical disk
    $partitions = Get-Partition | Where-Object { $_.DiskNumber -eq $physicalDisk.DeviceID }

    # Iterate through the partitions and find the corresponding logical disks
    foreach ($partition in $partitions) {
        # Get the drive letter
        $driveLetter = $partition.DriveLetter

        # Get the partition size
        $partitionSize = [math]::Round($partition.Size / 1GB, 2)

        # Get the free space and total size of the logical disk corresponding to this partition
        $volume = Get-Volume | Where-Object { $_.DriveLetter -eq $driveLetter }

        if ($volume) {
            $freeSpace = [math]::Round($volume.SizeRemaining / 1GB, 2)
            $totalVolumeSize = [math]::Round($volume.Size / 1GB, 2)
        }

        # Print the information if the drive letter is available (it might not be for system partitions)
        if ($driveLetter) {
            Write-Host "Drive Letter: $driveLetter`:"
            Write-Host "Device Name: $deviceName"
            Write-Host "EBS Volume ID: $ebsVolumeId"
            Write-Host "Partition Size (GB): $partitionSize"
            Write-Host "Free Space (GB): $freeSpace"
            Write-Host "Total Volume Size (GB): $totalVolumeSize"
            Write-Host "Total Drive Size (GB): $totalSize"
            Write-Host "-----------------------------------"
        }
    }
}
```

