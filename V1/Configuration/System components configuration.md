---
uid: SystemComponentsConfiguration
---

# System components configuration

Edge Data Store components are Modbus TCP EDS adapter, OPC UA EDS adapter, and the Storage component. These components are only active if they are configured for the system to use them. EDS itself needs only a small amount of configuration - the list of components and the HTTP Port used for REST calls.

The default _System_Components.json_ file for the System component contains the following information. 
```json
[
  {
    "ComponentId": "Storage",
    "ComponentType": "EDS.Component"
  }
]
```

The Storage component is required for Edge Data Store to run and only one Storage component is supported. Each Modbus device needs a separate Modbus TCP EDS adapter component to connect to EDS and each OPC UA device needs a separate OPC UA EDS adapter component to connect to EDS. Add additional Modbus TCP EDS adapter and OPC UA EDS adapter components if needed.  

## Add system components

1. Using any text editor, create a JSON file with the ComponentId and ComponentType. The following example adds a Modbus TCP EDS adapter. 

    ```json
      {
        "ComponentId": "Modbus1",
        "ComponentType": "Modbus"
      }
    ```
   **Note:** A unique ComponentId is necessary for each component in the system. This example uses the ComponentId Modbus1 since it is the first Modbus TCP EDS adapter.

2. Save the JSON file with the name _AddComponent.json_. 
3. From the same directory where the file exists, run the following curl script:

    ```bash
    curl -i -d "@AddComponent.json" -H "Content-Type: application/json" http://localhost:5590/api/v1/configuration/system/components
    ```

After the curl command completes successfully, the new component is available for configuration and use.

## Parameters for system components

The following parameters are used to define system components.

| Parameters     | Required | Type    | Nullable | Description |
| -------------- | -------- | --------| ---------|-------------|
| ComponentId    | Required |`string` | Yes      | The ID of the component. It can be any alphanumeric string, for example Storage.|
| ComponentType  | Required |`string` | Yes      | The type of the component, for example EDS.Component. There are three types of components: Storage, OPC UA EDS Adapter, and Modbus TCP EDS Adapter. |

## System components example

```json
[
  {
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
]
```
