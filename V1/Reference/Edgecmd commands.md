---
uid: EdgecmdCommands
---

# Edgecmd commands

The following tables gives an overview of available edgecmd commands that you can use with components of the Edge System. Every command that you use with the edgecmd utility has to be preceded by `edgecmd`.

| edgecmd command | Description | Examples |
|-----------------|-------------|----------|
|`Help`| Display instructions on how to use a certain component and facet of Edge Data Store. | `Help System`<br>**or**<br> `Help System Port`|
|`Configuration`| Display the entire configuration for every Edge Data Store component. |
|`Configuration System Components` |Display the components that are currently configured. | 
|`Configuration System Components componentId=<componentId> componentType=<componentType>` | Add a new component.  | `Configuration System Components componentId=Modbus1 componentType=Modbus`|
|`Configuration System Components id=<componentId> delete` |Delete a component. | `Configuration System Components id=Modbus1 delete` |
|`Configuration <componentId>` | Display component specific configuration. | `Configuration System`<br>or<br>`Configuration OpcUa1`|
|`Configuration <componentId> <facetName>` | Display facet specific configuration of an Edge Data Store component. |  `Configuration Storage Logging`|
|`Configuration <componentId> <facetName> id=<IndexToRetrieve>`| Display the configuration of specific entry of a facet. | `Configuration Storage PeriodicEgressEndpoints id=Endpoint1` |
|`Configuration <componentId> DataSource` | Configure the data source for either the Modbus TCP EDS adapter or the OPC UA EDS adapter. | For examples, see [OPC UA data source configuration](xref:OPCUADataSourceConfiguration) and [Modbus TCP data source configuration](xref:ModbusTCPDataSourceConfiguration)|
|`Configuration <componentId> DataSelection` | Configure the data selection for either the Modbus TCP EDS adapter or the OPC UA EDS adapter. | For examples, see [OPC UA data selection configuration](xref:OPCUADataSelectionConfiguration) and [Modbus TCP data selection configuration](xref:ModbusTCPDataSelectionConfiguration)|
|`Configuration <componentId> Logging` | Configure logging for either the Modbus TCP EDS adapter or the OPC UA EDS adapter. | For examples, see [Logging configuration](xref:LoggingConfiguration)|
| `Configuration file=<PathToJsonFile>` | Import a bulk configuration through JSON file. | `Configuration file="~/Bulk_Storage_Runtime.json"`|
| `Configuration <componentId> <facetName> file=<PathToJsonFile>` | Import a facet specific configuration file for a component. | `Configuration Modbus1 DataSource file="~/Modbus_DataSource.json"`|
