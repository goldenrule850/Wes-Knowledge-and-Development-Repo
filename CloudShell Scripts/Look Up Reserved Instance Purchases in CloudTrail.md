
```bash
aws cloudtrail lookup-events --lookup-attributes AttributeKey=EventName,AttributeValue=PurchaseReservedInstancesOffering --start-time "2024-02-13T00:00:00Z" --end-time "2024-02-14T00:00:00Z"
```

In this command:

- Replace `2023-01-01T00:00:00Z` with the actual start date and time for your search. The `Z` denotes Zulu time, which is the same as UTC.
- Replace `2023-01-02T00:00:00Z` with the actual end date and time for your search.