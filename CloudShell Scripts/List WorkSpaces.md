### List WorkSpaces - Username
```bash
#!/bin/bash

# Lists all AWS WorkSpaces usernames in the current AWS account, sorted alphabetically

# Get WorkSpaces information and extract the UserName field
aws workspaces describe-workspaces | jq -r '.Workspaces[].UserName' | sort
```

### List Complete WorkSpace Information
```bash
#!/bin/bash

# Function to map ComputeTypeName to vCPU and RAM
map_specs() {
  case $1 in
    "VALUE") echo "1 vCPU | 2GB RAM" ;;
    "STANDARD") echo "2 vCPU | 4GB RAM" ;;
    "PERFORMANCE") echo "2 vCPU | 8GB RAM" ;;
    "POWER") echo "4 vCPU | 16GB RAM" ;;
    "POWERPRO") echo "8 vCPU | 32GB RAM" ;;
    "GRAPHICS") echo "8 vCPU | 15GB RAM + GPU" ;;
    "GRAPHICSPRO") echo "16 vCPU | 122GB RAM + GPU" ;;
    *) echo "Unknown Compute Type" ;;
  esac
}

# Extract workspaces details
workspaces_json=$(aws workspaces describe-workspaces)

# Parse each workspace and print details
echo "$workspaces_json" | jq -c '.Workspaces[]' | while read -r ws; do
  username=$(echo "$ws" | jq -r '.UserName')
  compute_type_name=$(echo "$ws" | jq -r '.WorkspaceProperties.ComputeTypeName')
  root_volume_size=$(echo "$ws" | jq -r '.WorkspaceProperties.RootVolumeSizeGib')
  user_volume_size=$(echo "$ws" | jq -r '.WorkspaceProperties.UserVolumeSizeGib')
  specs=$(map_specs "$compute_type_name")
  
  # Print formatted workspace details
  echo "$username | Size: $compute_type_name | Root: ${root_volume_size}GB | User: ${user_volume_size}GB | Specs: $specs"
done | sort
```

