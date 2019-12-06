---
uid: EdgecmdCommands
---

# Edgecmd commands

The following tables gives an overview of available edgecmd commands that you can use with components of the Edge System. Every command that you use with the edgecmd utility has to be preceded by `edgecmd`.

## Edge  Data Store

| edgecmd command | Description | Examples |
|-----------------|-------------|----------|
|`Help`| Display instructions on how to use a certain component and facet of Edge Data Store. | `Help System`<br>**or**<br> `Help System Port`|
|`Configuration System Components` |Display the components that are currently configured. | 
|`Configuration System Components componentId=<componentId> componentType=<componentType>` | Add a new component  | `Configuration System Components componentId=Modbus1 componentType=Modbus`|
|`Configuration <componentId> DataSource` | Configure the data source for either the Modbus TCP EDS adapter or the OPC UA EDS adapter | For examples, see [OPC UA data source configuration](xref:OPCUADataSourceConfiguration) and [Modbus TCP data source configuration](xref:ModbusTCPDataSourceConfiguration)|
|`Configuration <componentId> DataSelection` | Configure the data selection for either the Modbus TCP EDS adapter or the OPC UA EDS adapter | For examples, see [OPC UA data selection configuration](xref:OPCUADataSelectionConfiguration) and [Modbus TCP data selection configuration](xref:ModbusTCPDataSelectionConfiguration)|
|`Configuration <componentId> Logging` | Configure the data source for either the Modbus TCP EDS adapter or the OPC UA EDS adapter | For examples, see [Logging configuration](xref:LoggingConfiguration)|
|`Configuration System Components id=<componentId> delete` |Delete a component | `Configuration System Components id=Modbus1 delete` |

