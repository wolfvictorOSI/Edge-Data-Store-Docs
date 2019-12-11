---
uid: system_schema
---

# Sample system configuration

```json
   "System": {
        "Logging": {
            "logLevel": "Information",
            "logFileSizeLimitBytes": 34636833,
            "logFileCountLimit": 31
        },
        "Components": [{
                "componentId": "OpcUa1",
                "componentType": "OpcUa"
            },
            {
                "componentId": "Modbus1",
                "componentType": "Modbus"
            },
            {
                "componentId": "Storage",
                "componentType": "EDS.Component"
            }
        ],
        "HealthEndpoints": [],
        "Port": {
            "port": 5590
        }
    }
```

# System configuration schema

| Abstract            | Extensible | Status       | Identifiable | Custom properties | Additional properties | Defined in                                               |
| ------------------- | ---------- | ------------ | ------------ | ----------------- | --------------------- | -------------------------------------------------------- |
| Can be instantiated | Yes        | Experimental | No           | Forbidden         | Forbidden             | [Modbus_Logging_schema.json](Modbus_Logging_schema.json) |

# System configuration properties

| Property                                        | Type      | Required | Nullable | Defined by                            |
| ----------------------------------------------- | --------- | -------- | -------- | ------------------------------------- |
| [Logging](#logging)         | [`SystemLoggingConfiguration`](xref:system_Logging_schema) | Optional | Yes      | EdgeLoggerConfiguration |
| [Components](#components) | [`[SystemComponentsConfiguration]`](xref:system_Components_schema) | Optional | Yes      | ComponentsConfiguration |
| [HealthEndpoints](#healthEndpoints) | [`[SystemHealthEndpointsConfiguration]`](xref:system_HealthEndpoints_schema) | Optional | Yes      | HealthEndpointsConfiguration |
| [Port](#port) | [`SystemPortConfiguration`](xref:portschema) | Optional | Yes      | PortConfiguration |
