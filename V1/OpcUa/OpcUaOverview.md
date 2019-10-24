---
uid: opcUaOverview
---

# OPC UA EDS adapter

## Overview

The OPC UA EDS adapter transfers time-series data from OPC UA devices into Edge Data Store.

You can add a single OPC UA EDS adapter during installation. If you want multiple OPC UA EDS adapters, see [Edge Data Store Configuration](xref:EdgeDataStoreConfiguration) on how to add a new component to Edge Data Store. The following example explains how to configure the first adapter. If another adapter has been installed, substitute the name of the installed adapter in the below example for OpcUa1.

As with other EDS adapters, the OPC UA EDS adapter is configured with data source and data selection JSON documents. The data source configurations are identical with other adapters, but OPC UA supports an option to generate a data selection file template that you can manually edit and use for subsequent configuration. See [OPC UA Data Selection](xref:opcUaDataSelection) for details. Once you create a template file, you can reuse it on both Linux and Windows without changes.

OPC UA is an open standard, which ensures interoperability, security, and reliability of industrial automation devices and systems. OPC UA is recognized as one of the key communication and data modeling technologies of Industry 4.0, due to the fact that it works with many software platforms, and is completely scalable and flexible.

## Supported features

### Data Types

The table below lists OPC UA variable types that the OPC UA EDS adapter supports data collection from and types of streams that are going to be created in Edge Data Store.

| OPC UA data type | Stream data type |
|------------------|------------------|
| Boolean          | Boolean          |
| Byte             | Int16            |
| SByte            | Int16            |
| Int16            | Int16            |
| UInt16           | UInt16           |
| Int32            | Int32            |
| UInt32           | UInt32           |
| Int64            | Int64            |
| UInt64           | UInt64           |
| Float            | Float32          |
| Double           | Float64          |
| DateTime         | DateTime         |
| String           | String           |

### Export operation

The OPC UA EDS adapter is able to export available OPC UA dynamic variables by browsing the OPC UA hierarchies or sub-hierarchies. Browse can be limited by specifying comma separated collection of nodeIds in data source configuration (RootNodeIds) which are going to be treated as a root(s) from where the adapter starts the browse operation. The adapter triggers export operation after successful connection to the OPC UA server when the data selection file doesn't exist in configuration directory. The exported data selection JSON file can be copied from the directory or retrieved via REST API call.

Data selection file can be also created manually in order to avoid potentially long and expensive browse operation and configured before configuring data source or pushed in one configuration call with data source configuration.

## Operational overview

### Adapter configuration

In order for the OPC UA EDS adapter to start data collection, you need to configure the adapter. See [Configuration of OPC UA data source] (#configuration-of-opc-ua-data-source) and [Configuration of OPC UA data selection] (#configuration-of-opc-ua-data-selection). To configure the adapter, configure the following:

Data source: Provide the information of the data source from where the adapter should collect data.
Data selection: Perform selection of OPC UA items that adapter should should subscribe for data.

## Network communication

The OPC UA EDS adapter communicates with the OPC UA server through TCP/IP network using opc.tcp binary protocol.

### Stream creation

The OPC UA EDS adapter creates types upon receiving the value update for a stream from OPC UA subscription per stream and streams are created for selected OPC UA items in the data selection configuration. One stream is going to be created in Edge Data Store for every selected OPC UA item in data selection configuration.

### Connection

The OPC UA EDS adapter uses binary opc.tcp protocol to communicate with the OPC UA servers. The X.509-type client and server certificates are exchanged and verified (when security is enabled) and the connection to the configured OPC UA server is established.

### Data collection

OPC UA EDS adapter is collecting time-series data from selected OPC UA dynamic variables through OPC UA subscriptions (unsolicited reads). This version of adapter supports Data Access (DA) part of OPC UA specification.

### Streams created by OPC UA EDS adapter

OPC UA EDS adapter creates a stream with two properties per selected OPC UA item. The properties are defined in the following table:

| Property name | Data type | Description |
|---------------|-----------|-------------|
| Timestamp     | DateTime  | Timestamp of the given OPC UA item value update. |
| Value         | Based on type of incoming OPC UA value | Value of the given the OPC UA item value update. |

Stream ID is a unique identifier of each stream created by the adapter for a given OPC UA item. In case the Custom Stream ID is specified for the OPC UA item in data selection configuration, the OPC UA EDS adapter is going to use that as a stream ID for the stream. Otherwise, the adapter constructs the stream ID using the following format constructed from OPC UA item node ID:

```
<Adapter Component ID>.<Namespace>.<Identifier>
```

```
Note: Naming convention is affected by StreamIdPrefix and ApplyPrefixToStreamID settings in data source configuration. For more informaton please refer to **Configuration of OPC UA data source** section.
```

## Configuration of OPC UA data source

To use the OPC UA EDS adapter, you must configure from which OPC UA data source it will be receiving data.

### Procedure

**Note:** You cannot modify OPC UA data source configurations manually. You must use the REST endpoints to add or edit the configuration.

Complete the following to configure the OPC UA data source:

1. Using any text editor, create a file that contains an OPC UA data source in JSON form.
    - For content structure, see the following OPC UA data source example section.
    - For a table of all available parameters, see the following **Parameters for OPC UA data source** section.
2. Save the file as _DataSource.config.json_.
3. Use any [tool](xref:managementTools) capable of making HTTP requests to execute a POST command with the contents of that file to the following endpoint: `http://localhost:5590/api/v1/configuration/<EDS adapterId>/DataSource/`. 

   **Note:** During installation it is possible to add a single OPC UA EDS adapter, and it is named OpcUa1. The example below uses this component name.

    - Example using cURL:

```bash
curl -v -d "@DataSource.config.json" -H "Content-Type: application/json" -X POST "http://localhost:5590/api/v1/configuration/OpcUa1/DataSource"
```

### Parameters for OPC UA data source

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


### OPC UA data source example

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

## Configuration of OPC UA data selection

In addition to the data source configuration, you need to provide a data selection configuration to specify the data you want the OPC UA EDS adapter to collect from the data sources.

### Procedure

**Note:** You cannot modify OPC UA data selection configurations manually. You must use the REST endpoints to add or edit the configuration.

Complete the following to configure OPC UA data selection:

1. Using any text editor, create a file that contains an OPC UA data selection in JSON form.
    - For content structure, see the following OPC UA data selection example.
    - For a table of all available parameters, see the following Parameters for **OPC UA data selection** section.
2. Save the file as _DataSelection.config.json_.
3. Use any [tool](xref:managementTools) capable of making HTTP requests to execute a POST command with the contents of that file to the following endpoint: `http://localhost:5590/api/v1/configuration/<EDS adapterId>/DataSelection/`
    - Example using cURL:


```bash
curl -v -d "@DataSelection.config.json" -H "Content-Type: application/json" -X POST "http://localhost:5590/api/v1/configuration/<EDS adapterId>/DataSelection"
```

### Parameters for OPC UA data selection

| Parameter     | Required | Type | Description |
|---------------|----------|------|-------------|
| **Selected** | Optional | bool | This field is used to select or clear a measurement. To select an item, set to true. To remove an item, leave the field empty or set to false.  If not configured, the default value is false.|
| **Name**      | Optional | string | The optional friendly name of the data item collected from the data source. If not configured, the default value will be the stream id |
| **NodeId**    | Required | string | The NodeId of the variable. |
| **StreamID** | Required | string | The custom stream ID that will be used to create the streams. If not specified, the Modbus TCP EDS adapter will generate a default stream ID based on the measurement configuration. A properly configured custom stream ID follows these rules:<br><br>Is not case-sensitive.<br>Can contain spaces.<br>Cannot start with two underscores ("__").<br>Can contain a maximum of 260 characters.<br>Cannot use the following characters: / : ? # [ ] @ ! $ & ' ( ) \ * + , ; = % < > &#124;<br>Cannot start or end with a period.<br>Cannot contain consecutive periods.<br>Cannot consist of only periods.

### OPC UA data selection example

The following is an example of valid OPC UA Data Selection configuration:

```json
[
 {
    "Selected": true,
    "Name": "Random1",
    "NodeId": "ns=5;s=Random1",
    "StreamId": "CustomStreamName"
  },
  {
    "Selected": false,
    "Name": "Sawtooth1",
    "NodeId": "ns=5;s=Sawtooth1",
    "StreamId": null
  },
  {
    "Selected": true,
    "Name": "Sinusoid1",
    "NodeId": "ns=5;s=Sinusoid1",
    "StreamId": null
  }
]
```

## OPC UA adapter security

The OPC UA security standard is concerned with the authentication of client and server applications, the authentication of users and confidentiality of their communication. As the security model relies heavily on Transport Level Security (TLS) to establish a secure communication link with an OPC UA server, each client, including the OSIsoft Adapter, must have a digital certificate deployed and configured. Certificates uniquely identify client applications and machines on servers, and allow for creation of a secure communication link when trusted on both sides.

OSIsoft Adapter for OPC UA generates a self-signed certificate when the first secure connection attempt is made. Each OPC UA Adapter instance creates a certificate store where its own certificates, as well as those of the server, will be persisted.

### Procedure

1. Configure the data source to use secure connection (Set UseSecureConnection as true).
2. Add server's certificate to the adapter's trust store.
3. Add adapter's certificate to the server's trust store.

### Data source configuration

```json
{
"EndpointUrl": "opc.tcp://IP-Address/TestOPCUAServer",
"UseSecureConnection": true,
"UserName": null,
"Password": null,
"RootNodeIds": null,
"IncomingTimestamp": "Source"
}
```

> **Note:** OSIsoft strongly recommends using secure connections in production environment(s).

### Adapter Certificate store

Adapter Certificate store location:

```bash
Windows: %programdata%\OSIsoft\EdgeDataStore\{ComponentId}\Certificates

Linux: /usr/share/OSIsoft/EdgeDataStore/{ComponentId}/Certificates
```

Adapter Trust store location:

```bash
Windows: %programdata%\OSIsoft\EdgeDataStore\{ComponentId}\Certificates\Trusted\certs

Linux: /usr/share/OSIsoft/EdgeDataStore/{ComponentId}/Certificates/Trusted/certs
```

Adapter Rejected certificates location:

```bash
Windows: %programdata%\OSIsoft\EdgeDataStore\{ComponentId}\Certificates\RejectedCertificates\certs

Linux: /usr/share/OSIsoft/EdgeDataStore/{ComponentId}/Certificates/RejectedCertificates/certs
```

The adapter verifies whether the server certificate is present in the adapter trust store location and is therefore trusted. In case the certificates were not exchanged upfront, the adapter persists the server certificate within the RejectedCertificates folder and the following warning message about the rejected server certificate will be printed:

```bash
~~2019-09-08 11:45:48.093 +01:00~~ [Warning] Rejected Certificate: "DC=MyServer.MyDomain.int, O=Prosys OPC, CN=Simulation
```

After the certificate is reviewed and approved, it can be manually moved from the “RejectedCertificates\certs” folder to the “Trusted\certs" folder using a file explorer or command-line interpreter.

- Linux example using command-line:

```bash
 mv /usr/share/OSIsoft/EdgeDataStore/OpcUa1/Certificates/RejectedCertificates/certsSimulationServer\ \[F9823DCF607063DBCECCF6F8F39FD2584F46AEBB\].der /usr/share/OSIsoft/EdgeDataStore/OpcUa1/Certificates/Trusted/certs/
```

> **Note:** Administrator or root privileges are required to perform this operation.

When the certificate is in the adapter trust store, the adapter trusts the server and the connection attempt proceeds in making the  connection call to the configured server. Connection succeeds only when the adapter certificate is trusted on the server side. See your OPC UA server documentation for more details on how to make a client certificate trusted. In general, servers work in a similar fashion to the clients; hence a similar approach for making the server certificate trusted on the client side can be taken on the server.

When certificates are mutually trusted, the connection attempt succeeds and the adapter is connected to the most secure endpoint provided by the server.

