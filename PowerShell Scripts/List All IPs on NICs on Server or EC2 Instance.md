This command outputs the IP addresses (`IPAddress`), the interface alias (`InterfaceAlias`), and the interface index (`InterfaceIndex`), which can help you identify which ENIs IP addresses are associated with.

```powershell
Get-NetIPAddress | Select-Object IPAddress, InterfaceAlias, InterfaceIndex
```

