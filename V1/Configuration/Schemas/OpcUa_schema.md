---
uid: opcua_schema
---

# OPC UA configuration schema

```

```

| Abstract            | Extensible | Status       | Identifiable | Custom Properties | Additional Properties | Defined In                                               |
| ------------------- | ---------- | ------------ | ------------ | ----------------- | --------------------- | -------------------------------------------------------- |
| Can be instantiated | Yes        | Experimental | No           | Forbidden         | Forbidden             | [OpcUa_Logging_schema.json](OpcUa_Logging_schema.json) |

## OPC UA configuration properties

| Property                                        | Type      | Required | Nullable | Defined by                            |
| ----------------------------------------------- | --------- | -------- | -------- | ------------------------------------- |
| [Logging](#logging)         | [`OpcUaLoggingConfiguration`](xref:opcUa_Logging_schema) | Optional | Yes      | EdgeLoggerConfiguration |
| [DataSource](#datasource) | [`DataSourceConfiguration`](xref:opcUa_DataSource_Schema) | Optional | Yes      | ComponentsConfiguration |
| [DataSelection](#dataselection) | [`[OpcUaDataSelectionConfiguration]`](xref:opcUa_DataSelection_schema) | Optional | Yes      | DataSelectionConfiguration |

