---
uid: LoggingConfiguration
---

# Logging configuration

Each message in the log displays the message severity level, timestamp, and the message itself. By default, Edge Data Store captures Information, Warning and Error messages in the message log.

> **Note:** The individual logging files of Edge Data Store and the components are the following:<br>
> - Edge Data Store: _System_Logging.json_
> - Storage: _Storage_Logging.json_
> - OSIsoft Adapter for OPC UA: _OpcUa1_Logging.json_
> - OSIsoft Adapter for Modbus TCP: _Modbus1_Logging.json_ <br><br>
> If you have more than one OSIsoft Adapter of the same kind configured, the default file name will incrementally change, for example _OpcUa2_Logging.json_

## Configure logging

To adjust the message logging behavior, complete the following:

1. Using any text editor, open the the _ _Logging.json_ file that you want.
2. Change the values as needed, so it looks similar to the [Logging example](#logging-example).
3. Use any tool capable of making HTTP requests to execute a POST command with the contents of that file to the respective endpoint. <br><br> Example using cURL for the Edge Data Store logging endpoint (run this command from the same directory where the file is located):

```bash
curl -v -d "@System_Logging.json" -H "Content-Type application/json" -X POST http://localhost:5590/api/v1/configuration/System/Logging
```

> **Note:** The other endpoints are the following:<br>
> - Edge Data Store: `http://localhost:5590/api/v1/configuration/System/Logging`
> - Storage: `http://localhost:5590/api/v1/configuration/Storage/Logging`
> - OSIsoft Adapter for OPC UA: `http://localhost:5590/api/v1/configuration/OpcUa1/Logging`
> - OSIsoft Adapter for Modbus TCP: `http://localhost:5590/api/v1/configuration/Modbus1/Logging`

## Logging schema

The following table defines the basic behavior of any of the _ _Logging.json_ files.

| Abstract            | Extensible | Status       | Identifiable | Custom properties | Additional properties | 
| ------------------- | ---------- | ------------ | ------------ | ----------------- | --------------------- | 
| Can be instantiated | Yes        | Experimental | No           | Forbidden         | Forbidden             |

## Parameters for logging

The following parameters are available for configuring logging.

| Parameter                   | Required | Type      | Nullable | Description |
| --------------------------- | ---------| --------  | -------- | ----------- |
| **LogFileCountLimit**       | Optional | `integer` | Yes      | The log level settings that you want. The following options are available: <br> **Verbose** - Captures all messages: Verbose, Debug, Information, Warning and Error <br> **Debug** - Captures most messages: Debug, Information, Warning and Error <br> **Information** - Captures most messages: Information, Warning and Error <br> **Warning** - Captures only Warning and Error messages <br> **Error** - Captures Error messages only |
| **LogFileSizeLimitBytes**   | Optional | `integer` | Yes      | The maximum size in bytes of log files that the service will create for the component. It must be a positive integer.            |
| **LogLevel**                | Optional | reference | No       | The maximum number of log files that the service will create for the component. It must be a positive integer.            |

## Logging example

```bash
{
"LogLevel": "Information",
"LogFileSizeLimitBytes": 34636833,
"LogFileCountLimit": 31
}
```
