---
uid: EdgecmdCommands
---

# Edgecmd commands

The following tables provide an overview of available edgecmd commands that you can use with components of Edge Data Store. Every command that you use with the edgecmd utility has to be preceded by `edgecmd`.

## Help

| edgecmd command | Description | Examples |
|-----------------|-------------|----------|
|`edgecmd Help`| Display general instructions on how to use  the edgecmd utility | 
|`edgecmd Help <componentName>`| Display help for a specific Edge Data Store component | `edgecmd Help System`|
|`edgecmd Help <componentName> <facetName>`| Display help for a specific facet of an Edge Data store component | `edgecmd Help System Port`|


## Configuration

### System

| edgecmd command | Description | Examples |
|-----------------|-------------|----------|
|`edgecmd Configuration`| Display the entire configuration for every Edge Data Store component. |
|`edgecmd Configuration System Components` |Display the components that are currently configured. | 
|`edgecmd Configuration System Components componentId=<componentId> componentType=<componentType>` | Add a new component.  | `edgecmd Configuration System Components componentId=Modbus1 componentType=Modbus`|
|`edgecmd Configuration System Components id=<componentId> delete` |Delete a component. | `edgecmd Configuration System Components id=Modbus1 delete` |

### Components
| edgecmd command | Description | Examples |
|-----------------|-------------|----------|
|`edgecmd Configuration <componentId>` | Display component specific configuration. | `edgecmd Configuration System`<br>or<br>`edgecmd  Configuration OpcUa1`|
|`edgecmd Configuration <componentId> <facetName>` | Display facet specific configuration of an Edge Data Store component. |  `edgecmd Configuration Storage Logging`|
|`edgecmd Configuration <componentId> <facetName> id=<IndexToRetrieve>`| Display the configuration of specific entry of a facet. | `edgecmd Configuration Storage PeriodicEgressEndpoints id=Endpoint1` |
|`edgecmd Configuration <componentId> DataSource` | Configure the data source for either the Modbus TCP EDS adapter or the OPC UA EDS adapter. | For examples, see [OPC UA data source configuration](xref:OPCUADataSourceConfiguration) and [Modbus TCP data source configuration](xref:ModbusTCPDataSourceConfiguration)|
|`edgecmd Configuration <componentId> DataSelection` | Configure the data selection for either the Modbus TCP EDS adapter or the OPC UA EDS adapter. | For examples, see [OPC UA data selection configuration](xref:OPCUADataSelectionConfiguration) and [Modbus TCP data selection configuration](xref:ModbusTCPDataSelectionConfiguration)|
|`edgecmd Configuration <componentId> Logging` | Configure logging for either the Modbus TCP EDS adapter or the OPC UA EDS adapter. | For examples, see [Logging configuration](xref:LoggingConfiguration)|

## Configuration with JSON files
| edgecmd command | Description | Examples |
|-----------------|-------------|----------|
| `edgecmd Configuration file=<PathToJsonFile>` | Import a bulk configuration through a JSON file. | `edgecmd Configuration file="~/Bulk_Storage_Runtime.json"`|
| `edgecmd Configuration <componentId> <facetName> file=<PathToJsonFile>` | Import a facet specific configuration file for a component. | `edgecmd Configuration Modbus1 DataSource file="~/Modbus_DataSource.json"`|
