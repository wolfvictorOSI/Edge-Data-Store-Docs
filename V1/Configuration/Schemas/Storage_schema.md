---
uid: storage_schema
---

# Sample Storage configuration

```json
  "Storage": {
        "Runtime": {
            "streamStorageLimitMb": 2,
            "streamStorageTargetMb": 1,
            "ingressDebugExpiration": "0001-01-01T00:00:00"
        },
        "Logging": {
            "logLevel": "Information",
            "logFileSizeLimitBytes": 34636833,
            "logFileCountLimit": 31
        },
        "PeriodicEgressEndpoints": []
    }
```

# Storage configuration schema

| Abstract            | Extensible | Status       | Identifiable | Custom properties | Additional properties | Defined in                                               |
| ------------------- | ---------- | ------------ | ------------ | ----------------- | --------------------- | -------------------------------------------------------- |
| Can be instantiated | Yes        | Experimental | No           | Forbidden         | Forbidden             | [Modbus_Logging_schema.json](Modbus_Logging_schema.json) |

# Storage configuration properties

| Property                                        | Type      | Required | Nullable | Defined by                            |
| ----------------------------------------------- | --------- | -------- | -------- | ------------------------------------- |
| [Runtime](#runtime)         | [`StorageRuntimeConfiguration`](xref:storage_Runtime_schema) | Optional | Yes      | StorageRuntimeConfiguration |
| [Logging](#logging) | [`StorageLoggingConfiguration`](xref:Storage_Logging_schema) | Optional | Yes      | StorageLoggingConfiguration |
| [PeriodicEgressEndpoints](#periodicegressendpoints) | [`[PeriodicEgressEndpointsConfiguration]`](xref:storage_PeriodicEgressEndpoints_schema) | Optional | Yes      | PeriodicEgressEndpointsConfiguration |
