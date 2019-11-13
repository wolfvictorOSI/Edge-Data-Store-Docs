---
uid: SystemComponentsConfiguration
---

# System components configuration

Edge Data Store uses JSON configuration files in a protected directory on Windows and Linux to store configuration that is read on startup. While the files are accessible to view, OSIsoft recommends that you use REST or the edgecmd command line tool for any changes you make to the files. As part of making Edge Data Store as secure as possible, any passwords or secrets that you configure are stored in encrypted form (with cryptographic key material stored separately in a secure location.) If you edit the files directly, the system may not work as expected.

**Note:** You can edit any single component or facet of the system using REST, but also configure the system as a whole with a single REST call.

Edge Data Store hosts other components. While the initial release of the Edge Data Store includes Modbus TCP, OPC UA, and Storage components, they are only active if you configure the system to use them. The system itself has a relatively small configuration surface area - the list of components and the HTTP Port used for REST calls.

## Configure system components

The default _System_Components.json_ file for the System component is the following. The Storage component is required for this initial release for Edge Data Store to run. With later releases of Edge Data Store, the storage component may not be required.

```json
[
  {
    "ComponentId": "Storage",
    "ComponentType": "EDS.Component"
  }
]
```

 You can add additional Modbus TCP and OPC UA components if you want, but only a single Storage component is supported. 

1. To add a new component, in this example a Modbus TCP EDS adapter, create the following JSON. 

> **Note:** A unique ComponentId is necessary for each component in the system. This example uses the ComponentId Modbus1 since it is the first Modbus TCP EDS adapter:

 ```json
  {
    "ComponentId": "Modbus1",
    "ComponentType": "Modbus"
  }
 ```

2. Save the JSON in a file named _AddComponent.json_. 
3. From the same directory where the file exists, run the following curl script:

```bash
curl -i -d "@AddComponent.json" -H "Content-Type: application/json" -X POST http://localhost:5590/api/v1/configuration/system/components
```

After the curl command completes successfully, you can configure or use the new component.

## System components schema

| Abstract            | Extensible | Status       | Identifiable | Custom properties | Additional properties | 
| ------------------- | ---------- | ------------ | ------------ | ----------------- | --------------------- | 
| Can be instantiated | Yes        | Experimental | No           | Forbidden         | Forbidden             |


## Parameters for system components

| Parameter                                        | Required |  Type | Nullable | Description |
| ----------------------------------------------- | --------- | ----- | -------- | ----------- |
| [Logging](#logging)         | Optional | [`SystemLoggingConfiguration`](xref:system_Logging_schema) | Yes      | |
| [Components](#components) | Optional | [`[SystemComponentsConfiguration]`](xref:system_Components_schema) | Yes      | |
| [HealthEndpoints](#healthEndpoints) | Optional | [`[SystemHealthEndpointsConfiguration]`](xref:system_HealthEndpoints_schema) | Yes  | |
| [Port](#port) | Optional | [`SystemPortConfiguration`](xref:portschema) | Yes      | |

## System components example

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
