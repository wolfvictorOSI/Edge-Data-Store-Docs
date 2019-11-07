---
uid: modbus_schema
---

# ModbusConfiguration schema

```

```

| Abstract            | Extensible | Status       | Identifiable | Custom Properties | Additional Properties | Defined In                                               |
| ------------------- | ---------- | ------------ | ------------ | ----------------- | --------------------- | -------------------------------------------------------- |
| Can be instantiated | Yes        | Experimental | No           | Forbidden         | Forbidden             | [Modbus_Logging_schema.json](Modbus_Logging_schema.json) |

# Modbus TCP configuration properties

| Property                                        | Type      | Required | Nullable | Defined by                            |
| ----------------------------------------------- | --------- | -------- | -------- | ------------------------------------- |
| [Logging](#logging)         | [`ModbusLoggingConfiguration`](xref:modbus_Logging_schema) | Optional | Yes      | EdgeLoggerConfiguration |
| [DataSource](#datasource) | [`DataSourceConfiguration`](xref:modbus_DataSource_schema) | Optional | Yes      | ComponentsConfiguration |
| [DataSelection](#dataselection) | [`[ModbusDataSelectionConfiguration]`](xref:modbus_DataSelection_schema) | Optional | Yes      | DataSelectionConfiguration |

