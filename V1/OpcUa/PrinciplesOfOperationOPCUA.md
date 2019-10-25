---
uid: PrinciplesOfOperationOPCUA.md
---

# Operational overview

## Adapter configuration

In order for the OPC UA EDS adapter to start data collection, you need to configure the adapter. For more information, see **Configuration of OPC UA data source** and **Configuration of OPC UA data selection**. To configure the adapter, configure the following:

Data source: Provide the information of the data source from where the adapter should collect data.
Data selection: Perform selection of OPC UA items that adapter should should subscribe for data.

## Network communication

The OPC UA EDS adapter communicates with the OPC UA server through TCP/IP network using opc.tcp binary protocol.

## Stream creation

The OPC UA EDS adapter creates types upon receiving the value update for a stream from OPC UA subscription per stream and streams are created for selected OPC UA items in the data selection configuration. One stream is going to be created in Edge Data Store for every selected OPC UA item in data selection configuration.

## Connection

The OPC UA EDS adapter uses binary opc.tcp protocol to communicate with the OPC UA servers. The X.509-type client and server certificates are exchanged and verified (when security is enabled) and the connection to the configured OPC UA server is established.

## Data collection

OPC UA EDS adapter is collecting time-series data from selected OPC UA dynamic variables through OPC UA subscriptions (unsolicited reads). This version of adapter supports Data Access (DA) part of OPC UA specification.

## Streams created by OPC UA EDS adapter

OPC UA EDS adapter creates a stream with two properties per selected OPC UA item. The properties are defined in the following table:

| Property name | Data type | Description |
|---------------|-----------|-------------|
| Timestamp     | DateTime  | Timestamp of the given OPC UA item value update. |
| Value         | Based on type of incoming OPC UA value | Value of the given the OPC UA item value update. |

Stream ID is a unique identifier of each stream created by the adapter for a given OPC UA item. In case the Custom Stream ID is specified for the OPC UA item in data selection configuration, the OPC UA EDS adapter is going to use that as a stream ID for the stream. Otherwise, the adapter constructs the stream ID using the following format constructed from OPC UA item node ID:

```
<Adapter Component ID>.<Namespace>.<Identifier>
```

> **Note:** Naming convention is affected by StreamIdPrefix and ApplyPrefixToStreamID settings in data source configuration. For more informaton please refer to **Configuration of OPC UA data source** section.
