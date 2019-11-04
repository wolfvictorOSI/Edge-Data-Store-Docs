---
uid: configurationSchemaList
---

# Configuration schemas

Edge Data Store is configured through a series of JSON files. The schemas for these files are provided in the installation directory and are documented following. 

## Edge Data Store configuration schemas

Use the following schemas to configure Edge Data Store:

- [EdgeLoggerConfiguration](.\System_Logging_schema.md)
- [PortConfiguration](.\System_Port_schema.md)
- [OmfHealthEndpointConfiguration](.\System_HealthEndpoints_schema.md)
- [EdgeDataStoreConfig](.\System_Components_schema.md)
  
## EDS adapters configuration schemas

Use the following schemas to configure EDS adapters:

### OPC UA

- [DataSourceConfiguration](.\OpcUa_DataSource_schema.md)
- [DataCollectionItem](.\OpcUa_DataSelection_schema.md)
- [EdgeLoggerConfiguration](.\OpcUa_Logging_schema.md)

### Modbus TCP

- [DataSourceConfiguration](.\Modbus_DataSource_schema.md)
- [DataSelectionConfiguration](.\Modbus_DataSelection_schema.md)
- [EdgeLoggerConfiguration](.\Modbus_Logging_schema.md)

## Storage configuration schemas

Use the following schemas to configure the Storage component:

  - [EdgeLoggerConfiguration](.\Storage_Logging_schema.md)
  - [StorageRuntimeConfiguration](.\Storage_Runtime_schema.md)
  - [OEMConfiguration](.\Storage_OEM_schema.md)
  - [Periodic Egress Endpoints](.\Storage_PeriodicEgressEndpoints_schema.md)
