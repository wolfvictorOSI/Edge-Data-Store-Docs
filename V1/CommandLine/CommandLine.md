---
uid: commandLine
---

# Configure EdgeCmd utility
The following sections provide instructions for the configuration of EdgeCmd utility for Windows or Linux.

**Note:** The following EdgeCmd utility locations are based on the installation instructions in [EdgeCmd utility](xref:Installedgecmd).

## Access EdgeCmd on Windows

Complete the following to access EdgeCmd on Windows:

1. Open a command prompt.
2. Type the following in the prompt and press Enter:

   ```cmd
   C:\Program Files\OSIsoft\EdgeCmd\edgecmd.exe
   ```

   **Note:** Specify the full path when you use EdgeCmd on Windows.

## Access EdgeCmd on Linux

Complete the following to access EdgeCmd on Linux:

1. Open a terminal window.
2. Type the following in the terminal and press Enter.

   ```bash
   /opt/OSIsoft/EdgeCmd/edgecmd
   ```

   **Note:** You can access EdgeCmd without using the full path on Linux. 

## Configure Edge Data Store with EdgeCmd

All configuration options that can be done using REST can also be done using the EdgeCmd utility and command line arguments.  Configuration and administrative REST interfaces are generally exposed through the command line. Read/write capabilities to the EDS storage component, OMF ingresss and SDS read/write capabilities are only available using the REST API.

## Get help

The Edgecmd utility provides a 'Help' utility. Complete the following to view general instructions on how to use the Edgecmd utility:

1. Open command line.
2. Type the following in the command line and press Enter.

	```bash
	edgecmd Help
	```
	
3. Optional: To receive help output for every configuration facet that a registered component supports, add a specific component ID to the end of the previous command. See example [Help for the System component](#help-for-the-system-component).
	
	**Note:** The help output also provides examples of commands that you can run to configure the component.
	
4. Optional: To receive help output for a specific facet within a component, add the facet name after the component ID. See example [Help for the Port facet within the System component](#help-for-the-port-facet-within-the-system-component).

### Examples

#### Help for the System component:

```bash
edgecmd Help System

---------------------------------------------------------------------------------------------------------
Component System command-line options => 'Logging'
---------------------------------------------------------------------------------------------------------
LogLevel                    [Required] Desired log level settings. Options: Verbose, Information, Warning, Error, Fatal.
LogFileSizeLimitBytes       [Required] Maximum size in bytes of log files that the service will create for this component. Must be no less than 1000.
LogFileCountLimit           [Required] Maximum number of log files that the service will create for this component. Must be a positive integer.

Example: ./edgecmd Configuration System Logging LogLevel=Warning
Example: ./edgecmd Configuration System Logging LogFileSizeLimitBytes=32768
Example: ./edgecmd Configuration System Logging LogFileCountLimit=5


---------------------------------------------------------------------------------------------------------
Component System command-line options => 'HealthEndpoints'
---------------------------------------------------------------------------------------------------------
Id                           [Optional] Id of existing configuration to be edited of removed.
Endpoint                     [Required] URL of OMF destination
UserName                     [Required group 1]  User name used for authentication to PI Web API OMF endpoint.
Password                     [Required group 1]  Password used for authentication to PI Web API OMF endpoint.
ClientId                     [Required group 2]  Client ID used for authentication to OSIsoft Cloud Services.
ClientSecret                 [Required group 2]  Client Secret used for authentication to OSIsoft Cloud Services.
Buffering                    [Optional] Set the buffering type for messages to this endpoint. Options are 'memory', 'disk' or 'none'. Defaults to 'none'.
MaxBufferSizeMB              [Optional] If an integer >0, this is the limit on the maximum megabytes of data to buffer for messages to this endpoint. Useful for limiting memory or disk usage growth in the event of disconnection to the endpoint. If the buffer is full, old messages will be discarded for new messages. Defaults to 0.
ValidateEndpointCertificate  [Optional] If true, endpoint certificate will be validated (recommended). If false, any endpoint certificate will be accepted. OSIsoft strongly recommends using disabled endpoint certificate validation for testing purposes only.

Note: Only one Required group must be specified. Group 1 for PI Web API or Group 2 for OCS.
Example: ./edgecmd Configuration System HealthEndpoints Endpoint=endpointURL UserName=UserName Password=Password


---------------------------------------------------------------------------------------------------------
Component System command-line options => 'Port'
---------------------------------------------------------------------------------------------------------
Port                        [Required] The tcp port to bind this application host to (Range [1024,65535])

Example: ./edgecmd Configuration System Port Port=5590


---------------------------------------------------------------------------------------------------------
Component System command-line options => 'Components'
---------------------------------------------------------------------------------------------------------
ComponentId                        [Required] ID of the hosted component.
ComponentType                      [Required] Type of the hosted component.

Example: ./edgecmd Configuration System Components ComponentId=Modus1 ComponentType=Modbus
```

#### Help for the Port facet within the System component

```bash
edgecmd Help System Port

---------------------------------------------------------------------------------------------------------
Component System command-line options => 'Port'
---------------------------------------------------------------------------------------------------------
Port                        [Required] The tcp port to bind this application host to (Range [1024,65535])

Example: ./edgecmd Configuration System Port Port=5590
```

## Edge Data Store components
The EdgeCmd utility enables you to add, configure, and delete Edge Data Store components.

### View components
Complete the following to view which components are currently configured on Edge Data Store.

1. Open command line.
2. Type the following in the command line and press Enter.

	```bash
	edgecmd Configuration System Components
	```

### Add components
Complete the following to register a new component.

1. Open command line.
2. Type the following in the command line, replacing `<componentId>` and `<componentType>` with the values that you want and press Enter.

	**Note:** Valid component types are "Modbus" and "OpcUa". If you are trying to register a Modbus EDS adapter, use "Modbus" and if you are trying to register an OPC UA adapter, use "OpcUa".
	
	```bash
	edgecmd Configuration System Components componentId=<componentId> componentType=<componentType>
	```

	Example: Modbus adapter component registration:

	```bash
	edgecmd Configuration System Components componentId=Modbus1 componentType=Modbus
	```

### Configure components

The EDS Modbus adapter and OPC UA adapter each have three configurable facets: data source, data selection, and logging. Complete the following to configure a facet.

1. Open command line.
2. Type the following in the command line, replacing `<componentId>` and `<facetName>` with the values that you want.

	```bash
	edgecmd Configuration <componentId> <facetName>
	```
3. Add key-value pairs to specify which values of the facet that you want to configure are to be changed and press Enter.
	
	Example: Configuration of the data source facet of a Modbus adapter:

	```bash
	edgecmd Configuration Modbus1 DataSource IpAddress=117.23.45.110 port=502 ConnectTimeout=15000 StreamIdPrefix="DataSource1"
	```

For detailed information on how to configure each adapter, see [OPC UA EDS adapter](xref:opcUaOverview) and [Modbus TCP EDS adapter](xref:modbusOverview) schemas.

### Delete components

Complete the following to delete components from the Edge Data Store.

1. Open command line.
2. Type the following in the command line, replacing `<componentId>` with the value that you want, and press Enter.

	```bash
	edgecmd Configuration System Components id=<componentId> delete
	```

**Note:** You cannot delete the Storage component because it is required for Edge Data Store to operate.


## Retrieve existing system configuration

You can use the edgecmd utility to view the configuration for each part of Edge Data Store.

- Complete the following to view the entire configuration for every system component.

	1. Open command line.
	2. Type the following in the command line and press Enter.

		```bash
		edgecmd Configuration
		```

- Complete the following to retrieve component specific configuration.

	1. Open command line.
	2. Type the following in the command line, replacing `<componentId>` with the value that you want, and press Enter.

		```bash
		edgecmd Configuration <componentId>
		```

- Complete the following to retrieve facet specific configuration of an Edge Data Store component.

	1. Open command line.
	2. Type the following in the command line, replacing `<componentId>` and `<facetName>` with the values that you want, and press Enter.

		```bash
		edgecmd Configuration <componentId> <facetName>
		```

- Complete the following to retrieve the configuration for a specific facet entry.

	1. Open command line.
	2. Type the following in the command line, replacing `<componentId>` and `<facetName>` with the values that you want.

		```bash
		edgecmd Configuration <componentId> <facetName> id=IndexToRetrieve
		```
	3. Add the parameters and their values of the facet that you want to configure and press Enter.

### Examples

**View the configuration of the 'System' component**

```bash
edgecmd Configuration System
{
  "Logging": {
    "logLevel": "Information",
    "logFileSizeLimitBytes": 34636833,
    "logFileCountLimit": 31
  },
  "HealthEndpoints": [],
  "Port": {
    "port": 5590
  },
  "Components": [
    {
      "componentId": "Storage",
      "componentType": "EDS.Component"
    }
  ]
}
```

**View the configuration for the 'Logging' facet within the 'Storage' component**

```bash
edgecmd Configuration Storage Logging
{
  "logLevel": "Information",
  "logFileSizeLimitBytes": 34636833,
  "logFileCountLimit": 31
}
```

**View the configuration of a specific entry in the 'PeriodicEgressEndpoint' facet within the 'Storage' component**

```bash
edgecmd Configuration Storage PeriodicEgressEndpoints id=Endpoint_1
{
  "id": "Endpoint_1",
  "executionPeriod": "2.00:00:00",
  "name": null,
  "description": null,
  "enabled": true,
  "endpoint": "http://localhost:5590",
  "clientId": null,
  "clientSecret": null,
  "userName": "user_54",
  "password": "***************",
  "validateEndpointCertificate": true,
  "tokenEndpoint": null,
  "debugExpiration": null,
  "namespaceId": "default",
  "backfill": false,
  "egressFilter": null,
  "streamPrefix": null,
  "typePrefix": null
}
```

## Configure Edge Data Store

- Complete the following to change all values of a facet.

	1. Open command line.
	2. Type the `componentId` and `facetName` where the configuration payload should go, followed by key=value pairs that you want to change. Then press Enter.

	Example: Change all values in the 'Logging' facet:

	```bash
	edgecmd Configuration Storage Logging LogLevel=Warning LogFileSizeLimitBytes=32768 LogFileCountLimit=5
	```

- Complete the following to configure any number of valid key=value pairs in a facet.

	1. Open command line.
	2. Type the `componentId` and `facetName` followed by the key=value pair that you want to change.  Then press Enter.

	Example: Change a single value in the 'Logging' facet:

	```bash
	edgecmd Configuration Storage Logging LogFileCountLimit=5
	```

- Complete the following to add an entry to a collection configuration.

	1. Open command line.
	2. Type the `componentId` and `facetName` followed by the facet's key=value pairs. Then press Enter.

	Example: Add the 'Health Endpoints' facet to the 'System' component:

	```bash
	edgecmd Configuration System HealthEndpoints Id=endpoint_1 Endpoint=endpointURL UserName=UserName Password=Password
	```
	**Note:** If an entry with the specified id already exists, it will be updated based on the new key=value pairs.

### Configure with JSON Files
You can also configure Edge Data Store by a JSON file input into the edgecmd application. File imports will completely replace the existing configurations that you are attempting to change. Therefore, it cannot be used to change individual values in a facet without modifying others.

To import a bulk configuration:
```bash
edgecmd Configuration file=PathToJsonFile
```

To import a facet specific configuration file for a component:
```
edgecmd Configuration componentId facetName file=PathToJsonFile
```

To import a file with configuration for individual facets, you can use a bulk file import operation. The file must contain just payload for the given component ID. 

Example command:

```bash
edgecmd Configuration file="~/Bulk_Storage_Runtime.json"
```

The file 'Bulk_Storage_Runtime.json' contains:
```JSON
{
	"Storage": {
		"Runtime": {
			"StreamStorageLimitMb": 66,
			"StreamStorageTargetMb": 33,
			"IngressDebugExpiration": "2020-07-08T01:00:00",
			"CheckpointRateInSec": 6,
			"TransactionLogLimitMB": 350,
			"EnableTransactionLog": true
		}
	}
}
```
The command will only affect the 'Runtime' facet in the 'Storage' component, it will not change any other components or facets. However, if you import a file containing the following, the 'StreamStorageLimitMb' and 'StreamStorageTargetMb' values would be modified, resetting the remaining values in the facet (IngressDebugExpiration, CheckpointRateInSec, TransactionLogLimitMB, and EnableTransactionLog) to their default values:
```JSON
{
	"Storage": {
		"Runtime": {
			"StreamStorageLimitMb": 66,
			"StreamStorageTargetMb": 33,
		}
	}
}
```

## Delete configuration entry

You can use the edgecmd utility to delete a configuration entry from a collection configuration (for example a single health endpoint of the 'HealthEndpoints' facet within the 'System' component) from Edge Data Store.

1. Specify the component ID, facet, and ID of the entry to be removed
2. Add the 'delete' keyword.

Example using edgecmd utility:
```bash
edgecmd Configuration System HealthEndpoints Id=endpoint_1 delete
```

## Delete configuration file

You can use the edgecmd utility to delete an entire configuration file with all its entries (for example the configuration file of the 'HealthEndpoints' facet within the 'System' component) from Edge Data Store.

1. Specify the component ID and facet.
2. Add the 'delete' keyword.

Example using edgecmd utility:

```bash
edgecmd Configuration System HealthEndpoints delete
```



