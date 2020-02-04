---
uid: EDSDataIngress
---

# Data ingress configuration

Edge Data Store supports the following protocols to ingress or store data:

- [OPC UA EDS adapter](xref:opcUaOverview): Use standard OPC UA equipment and protocols to send data into EDS.

- [Modbus TCP EDS adapter](xref:modbusOverview): Use standard Modbus TCP equipment and protocols to send data into EDS.

- OMF Ingress: Use the OSIsoft Message Format to send data from a custom application into EDS. OMF is a simple REST and JSON based data format designed for simplicity of custom application design. For more information, see [OSIsoft Message Format](xref:omfOverview).

- SDS Ingress: Use the OSIsoft Sequential Data Store (SDS) REST to send data from a custom application into EDS. SDS offers the most options for how to send, store, and retrieve data from EDS. For more information about using REST API calls with SDS, see [API calls for writing data](xref:sdsWritingDataApi).
