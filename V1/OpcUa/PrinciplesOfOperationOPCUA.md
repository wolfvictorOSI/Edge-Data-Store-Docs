---
uid: PrinciplesOfOperationOPCUA.md
---

# Principles of operation

This topic provides an operational overview of the OPC UA EDS adapter, focusing on streams creation and error handling.

## Adapter configuration

In order for the OPC UA EDS adapter to start data collection, you need to configure the adapter. For more information, see [OPC UA data source configuration](xref:OPCUADataSourceConfiguration) and [OPC UA data selection configuration](xref:OPCUADataSelectionConfiguration). To configure the adapter, you must define the following:

- Data source: Provide the data source from which the adapter should collect data.
- Data selection: Perform selection of OPC UA items to which the adapter should subscribe for data.
- Logging: Set up the logging attributes to manage the adapter logging behavior.

## Connection

The OPC UA EDS adapter uses the binary opc.tcp protocol to communicate with the OPC UA servers. The X.509-type client and server certificates are exchanged and verified (when security is enabled) and the connection to the configured OPC UA server is established.

## Stream creation

The OPC UA EDS adapter creates types upon receiving the value update for a stream. One stream is created in Edge Data Store for every selected OPC UA item in the data selection configuration.

## Data collection

OPC UA EDS adapter collects time-series data from selected OPC UA dynamic variables through OPC UA subscriptions (unsolicited reads). This version of adapter supports Data Access (DA) part of OPC UA specification.

## Streams by OPC UA EDS adapter

The OPC UA EDS adapter creates a stream with two properties per selected OPC UA item. The properties are defined in the following table:

| Property name | Data type | Description |
|---------------|-----------|-------------|
| Timestamp     | DateTime  | Timestamp of the given OPC UA item value update. |
| Value         | Based on type of incoming OPC UA value | Value of the given the OPC UA item value update. |

Stream ID is a unique identifier of each stream created by the adapter for a given OPC UA item. In case the Custom Stream ID is specified for the OPC UA item in data selection configuration, the OPC UA EDS adapter is going to use that as a stream ID for the stream. Otherwise, the adapter constructs the stream ID using the following format constructed from OPC UA item node ID:

```
<Adapter Component ID>.<Namespace>.<Identifier>
```

> **Note:** The naming convention is affected by StreamIdPrefix and ApplyPrefixToStreamID settings in data source configuration. For more informaton, see [OPC UA data source configuration](xref:OPCUADataSourceConfiguration).
