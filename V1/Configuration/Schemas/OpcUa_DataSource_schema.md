---
uid: opcUa_DataSource_Schema
---


# Sample OPC UA data source configuration

The OPC UA data source configuration schema specifies how to formally describe the data source parameters for OPC UA.

```json
{
    "EndpointUrl": "opc.tcp://<ip address>:<port - often 62541>/<server path>",
    "UseSecureConnection": false,
    "UserName": null,
    "Password": null,
    "RootNodeIds": null,
    "IncomingTimestamp": "Source",
    "StreamIdPrefix": "OpcUa"
}
```

# OPC UA data source configuration properties

| Property                                    | Type      | Required | Nullable | Defined by                            |
| ------------------------------------------- | --------- | -------- | -------- | ------------------------------------- |
| [EndpointUrl](#endpointurl)                 | `string`  | Optional | Yes      | DataSourceConfiguration (this schema) |
| [IncomingTimestamp](#incomingtimestamp)     | reference | Optional | No       | DataSourceConfiguration (this schema) |
| [Password](#password)                       | `string`  | Optional | Yes      | DataSourceConfiguration (this schema) |
| [RootNodeIds](#rootnodeids)                 | `string`  | Optional | Yes      | DataSourceConfiguration (this schema) |
| [StreamIdPrefix](#streamidprefix)           | `string`  | Optional | Yes      | DataSourceConfiguration (this schema) |
| [UseSecureConnection](#usesecureconnection) | `boolean` | Optional | No       | DataSourceConfiguration (this schema) |
| [UserName](#username)                       | `string`  | Optional | Yes      | DataSourceConfiguration (this schema) |


**Note:** All of the following _requirements_ need to be fulfilled.

## Requirement 1

- []() – `#/definitions/EdgeConfigurationBase`

## Requirement 2

`object` with following properties:

| Property              | Type    | Required |
| --------------------- | ------- | -------- |
| `EndpointUrl`         | string  | Optional |
| `IncomingTimestamp`   |         | Optional |
| `Password`            | string  | Optional |
| `RootNodeIds`         | string  | Optional |
| `StreamIdPrefix`      | string  | Optional |
| `UseSecureConnection` | boolean | Optional |
| `UserName`            | string  | Optional |
