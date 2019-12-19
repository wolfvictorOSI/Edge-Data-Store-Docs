---
uid: SystemComponentsConfiguration
---

# System components configuration

Edge Data Store includes Modbus TCP EDS adapter, OPC UA EDS adapter, and the Storage component. These components are only active if you configure the system to use them. EDS itself needs only a small amount of configuration - the list of components and the HTTP Port used for REST calls.

## Configure system components

The default _System_Components.json_ file for the System component contains the following information. 
```json
[
  {
    "ComponentId": "Storage",
    "ComponentType": "EDS.Component"
  }
]
```

The Storage component is required for Edge Data Store to run. Only a single Storage component is supported. You can add additional Modbus TCP EDS adapter and OPC UA EDS adapter components if you want.  

1. To add a new component a JSON file with the ComponentId and ComponentType. The following example adds a Modbus TCP EDS adapter. 

    ```json
      {
        "ComponentId": "Modbus1",
        "ComponentType": "Modbus"
      }
    ```
    > **Note:** A unique ComponentId is necessary for each component in the system. This example uses the ComponentId Modbus1 since it is the first Modbus TCP EDS adapter.

2. Save the JSON file with the name _AddComponent.json_. 
3. From the same directory where the file exists, run the following curl script:

    ```bash
    curl -i -d "@AddComponent.json" -H "Content-Type: application/json" http://localhost:5590/api/v1/configuration/system/components
    ```

After the curl command completes successfully, you can configure or use the new component.

## System components schema

The following table defines the basic behavior of the _AddComponent.json_ file.

| Abstract            | Extensible | Status       | Identifiable | Custom properties | Additional properties |                           
| ------------------- | ---------- | ------------ | ------------ | ----------------- | --------------------- | 
| Can be instantiated | Yes        | Experimental | No           | Forbidden         | Forbidden             |


## Parameters for system components

The following parameters are available for configuring system components.

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
