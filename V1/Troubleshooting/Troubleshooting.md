---
uid: troubleShooting
---

# Troubleshoot Edge Data Store

You have both local and remote means of diagnosing any issues you encounter while using or developing against Edge Data Store.

Edge Data Store supports a diagnostics namespace that is used to store streams containing [diagnostic](xref:EdgeDataStoreDiagnostics) information from Edge Data Store itself. As with any other stream data stored in the Edge Storage component, you can egress this to either a PI Web Server or OSIsoft Cloud Services to monitor the state of a system remotely.

In addition to diagnostics data, all components in Edge Data Store support OMF health messages. You configure health messages with the [Health endpoint configuration](xref:HealthEndpointsConfiguration), to send health data to either PI Web Server or OSIsoft Cloud Service endpoints for remote monitoring of devices.

## OMF ingress

Complete the following when a custom application fails to write stream data to EDS:

1. Verify the custom application is sending OMF messages in the correct order: 1) OMF type, 2) OMF container, 3) OMF data.

   **Note:** OMF messages must be sent in the correct order to be ingressed into Edge Data Store.
   
2. Refer to logging of warnings, errors, and messages for help with diagnosing these issues.

### OMF ingress logging

Ingress logging messages provide a record of ingress events. Complete the following to capture maximum information for troubleshooting:

1. Refer to [Logging Configuration](xref:LoggingConfiguration) to set logging parameters.
2. For maximum message logging information, set the log level to **Trace**.

### OMF ingress message debugging

Debugging helps to troubleshoot problems between an OMF application and Edge Data Store.  Complete the following to enable debugging:

1. Refer to [Storage Runtime Configuration](xref:storageruntime) to enable debugging.
2. Set an appropriate time value for the *IngressDebugExpiration* property. 

   **Note:** You can also disable debugging by setting the expiration value to *null*.

Examples of valid strings representing date and time:

    UTC: “yyyy-mm-ddThh:mm:ssZ”
    Local: “mm-dd-yyyy hh:mm:ss”

## Periodic egress

EDS periodic egress extracts data from SDS streams and sends the appropriate sequences of type, container, and data OMF messages on startup.  

**Note:** If you see unexpected data in an OCS or PI System, check if multiple devices are writing to the same SDS stream. 

1. Check all egress configuration files in Edge Data Store to verify whether any endpoints are duplicated. A duplicate endpoint means that more than one device is egressing data to it, resulting in unexpected data.
2. Assign stream prefixes in the [periodic egress endpoint configuration](xref:egress) to ensure that output data streams are logically separated in the systems of record.

   **Note:** Type prefixes may be helpful if you have changed a stream type definition on EDS. OMF types on both OCS and the PI System are immutable once created. If the type of the data stream changes, it is best to either delete the old type definition (if nothing is still using it) or add a type prefix to create a new unique type that will be used by new streams egressing from EDS to the systems of record.

### Periodic egress logging

Egress logging messages provide a record of egress events. Complete the following to capture maximum information for troubleshooting:

1. Refer to [Logging Configuration](xref:LoggingConfiguration) to set logging parameters.
2. For maximum message logging information, set the log level to **Trace**.

### Periodic egress debugging

Debugging helps to troubleshoot problems between Edge Data Store and the egress destination.  Complete the following to enable debugging:

1. Refer to [Data egress configuration](xref:egress) to enable debugging.
2. Set an appropriate time value for the *IngressDebugExpiration* property. 

   **Note:** You can also disable debugging by setting the expiration value to *null*.

Examples of valid strings representing date and time:

    UTC: “yyyy-mm-ddThh:mm:ssZ”
    Local: “mm-dd-yyyy hh:mm:ss”

### Debugging folder/file structure

The overall number and content length of each request/response pair can be quite large. Debug information is therefore stored to disk in a separate location from the typical log messages. Debug folders and files will be created under the Edge Data Store data folder as follows: 

    Windows: %programdata%\OSIsoft\EdgeDataStore\Storage\egressdump\{tenantId}\{namespaceId}\{egressId}\{omfType}\{Ticks}-{Guid}-{Req/Res}.txt

    Linux: /usr/share/OSIsoft/EdgeDataStore/Storage/egressdump/{tenantId}/{namespaceId}/{egressId}/{omfType}/{Ticks}-{Guid}-{Req/Res}.txt

The OMF specific elements of the file structure are defined in the following table:

| Element    | Represents                       |
|------------|----------------------------------|
| *omfType*  | The OMF message type: Type, Container, or Data.    |
| *Ticks*    | The time in milliseconds (tick count) for UTC DateTime when determined message would be written to disk.  |
| *Guid*     | The unique GUID for each request/response pair.     |
| *Req/Res*  | Whether the message was HTTP request or response.   |

