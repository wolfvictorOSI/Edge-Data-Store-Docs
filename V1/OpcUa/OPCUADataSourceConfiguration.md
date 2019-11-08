---
uid: OPCUADataSourceConfiguration
---

# OPC UA data source configuration

To use the OPC UA EDS adapter, you must configure from which OPC UA data source it will be receiving data.

## Configure OPC UA data source

> **Note:** You cannot modify OPC UA data source configurations manually. You must use the REST endpoints to add or edit the configuration.

Complete the following to configure the OPC UA data source:

1. Using any text editor, create a file that contains an OPC UA data source in JSON form.
    - For content structure, see [OPC UA data source example](#opc-ua-data-source-example).
    - For a table of all available parameters, see [Parameters for OPC UA data source](#parameters-for-opc-ua-data-source).
2. Save the file as _DataSource.config.json_.
3. Use any [tool](xref:managementTools) capable of making HTTP requests to execute a POST command with the contents of that file to the following endpoint: `http://localhost:5590/api/v1/configuration/<EDS adapterId>/DataSource/`. 

> **Note:** During installation, it is possible to add a single OPC UA EDS adapter which is named OpcUa1. The following example uses this component name.

Example using cURL (run this command from the same directory where the file is located):

```bash
curl -v -d "@DataSource.config.json" -H "Content-Type: application/json" -X POST "http://localhost:5590/api/v1/configuration/OpcUa1/DataSource"
```

## Parameters for OPC UA data source

The following parameters are available for configuring an OPC UA data source.

| Parameter | Required | Type |	Description |
|-----------|----------|------|-------------|
| **EndpointURL** | Required | string | The endpoint URL of the OPC UA server. The following is an example of the URL format: opc.tcp://OPCServerHost:Port/OpcUa/SimulationServer<br><br>**Note:** If you change the EndpointURL on a configured OPC UA EDS adapter that has ComponentID_DataSelection.json file exported, you will need to relocate the ComponentID_DataSelection.json file from the configuration directory to trigger a new browse (export).|
| **UseSecureConnection**|Optional | bool | When set to true, the OPC UA EDS adapter connects to a secure endpoint using OPC UA certificate exchange operation. The default is true. When set to false, the OPC UA EDS adapter connects to an unsecured endpoint of the server and certificate exchange operation is not required.<br><br>**Note:** OSIsoft recommends setting this option to false for testing purposes only.|
| **UserName** | Optional | string | User name for accessing the OPC UA server. |
| **Password** | Optional | string | Password for accessing the OPC UA server.<br><br>**Note:** OSIsoft recommends using REST to configure the data source when the password must be specified.|
| **RootNodeIds** | Optional | string |List of comma-separated NodeIds of those objects from which the OPC UA EDS adapter browses the OPC UA server address space. This option allows selecting only subsets of the OPC UA address by explicitly listing one or more NodeIds which are used to start the initial browse. For example: ns=5;s=85/0:Simulation, ns=3;s=DataItems. If not specified, it means that the whole address space will be browsed.|
| **IncomingTimestamp**	| Optional | string | Specifies whether the incoming timestamp is taken from the source, from the OPC UA server, or should be created by the OPC UA EDS adapter instance. **Source** - Default and recommended setting. The timestamp is taken from the source timestamp field. The source is what provides data for the item to the OPC UA server, such as a field device. **Server** - In case the OPC UA item has an invalid source timestamp field, the Server timestamp can be used. **Connector** - The OPC UA EDS adapter generates a timestamp for the item upon receiving it from the OPC UA server.|
| **StreamIdPrefix** | Optional | string | Specifies what prefix is used for Stream IDs. Naming convention is StreamIdPrefixNodeId. **Note:** An empty string means no prefix will be added to the Stream IDs. Null value means ComponentID followed by dot character will be added to the stream IDs (example: OpcUa1.NodeId).|


## OPC UA data source example

The following is an example of valid OPC UA data source configuration:

```json
{
    "EndpointUrl": "opc.tcp://IP-Address/TestOPCUAServer",
    "UseSecureConnection": true,
    "UserName": null,
    "Password": null,
    "RootNodeIds": null,
    "IncomingTimestamp": "Source",
    "StreamIdPrefix": null
}
```
