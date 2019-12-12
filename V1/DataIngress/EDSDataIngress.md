---
uid: EDSDataIngress
---

# Data ingress configuration

There are a number of ways to ingress or store data in the Edge Data Store:

- [OPC UA EDS adapter](xref:opcUaOverview): Use standard OPC UA equipment and protocols to send data into EDS.

- [Modbus TCP EDS adapter](xref:modbusOverview): Use standard Modbus TCP equipment and protocols to send data into EDS.

- [OMF Ingress](xref:omfOverview): Use the OSIsoft Message Format to send data from a custom application into EDS. OMF is a simple REST and JSON based data format designed for simplicity of custom application design.

- [SDS Ingress](xref:sdsWritingDataApi): Use the OSIsoft Sequential Data Store (SDS) REST to send data from a custom application into EDS. SDS offers the most options for how to send, store, and retrieve data from EDS.

**Note:** For Linux data ingress scenarios that include a large number of streams consider increasing the operating system's maximum number of open file descriptors per process. For more information, see (Linux and Windows Platform Differences)[xref:linuxWindows].
