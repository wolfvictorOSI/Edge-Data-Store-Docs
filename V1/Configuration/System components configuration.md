---
uid: SystemComponentsConfiguration
---

# System components configuration

The initial release of Edge Data Store includes Modbus TCP EDS adapter, OPC UA EDS adapter, and the Storage component. They are only active if you configure the system to use them. The system itself has a relatively small configuration surface area - the list of components and the HTTP Port used for REST calls.

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

 You can add additional Modbus TCP EDS adapter and OPC UA EDS adapter components if you want, but only a single Storage component is supported. 

1. To add a new component, in this example a Modbus TCP EDS adapter, create the following JSON. 

    ```json
      {
        "ComponentId": "Modbus1",
        "ComponentType": "Modbus"
      }
    ```
    > **Note:** A unique ComponentId is necessary for each component in the system. This example uses the ComponentId Modbus1 since it is the first Modbus TCP EDS adapter.

2. Save the JSON in a file named _AddComponent.json_. 
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
