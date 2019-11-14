---
uid: LoggingConfiguration
---

# Logging configuration

## Configure logging

## Logging schema

The following table defines the basic behavior of any of the _<Component name>_Logging.json_ files.

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
