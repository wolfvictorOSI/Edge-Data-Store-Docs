---
uid: EdgeDataStoreConfiguration
---

# Edge Data Store configuration

Edge Data Store uses JSON configuration files in a protected directory on Windows and Linux to store configuration that is read on startup. While the files are accessible to view, OSIsoft recommends that you use REST or the edgecmd command line tool for any changes you make to the files. As part of making Edge Data Store as secure as possible, any passwords or secrets that you configure are stored in encrypted form (with cryptographic key material stored separately in a secure location.) If you edit the files directly, the system may not work as expected.

**Note:** You can edit any single component or facet of the system using REST, but also configure the system as a whole with a single REST call.

Edge Data Store hosts other components. While the initial release of the Edge Data Store includes Modbus TCP, OPC UA, and Storage components, they are only active if you configure the system to use them. The system itself has a relatively small configuration surface area - the list of components and the HTTP Port used for REST calls.

## Configure Edge Data Store port

_System_Port.json_ specifies the port on which the System is listening for REST API calls. The same port is used for configuration and for writing data to OMF and SDS. The default configuration port is 5590. The default _System_Port.json_ file installed is:

```json
{
  "Port": 5590
}
```

Allowable ports are in the range of 1024-65535. 

Before you change the default, ensure that no other service or application on the computer running the EdgeDataStore is using that port - only one application or service can use a port. If you change the port number through the REST API, you must restart Edge Data Store.

1. Save the JSON containing the new port number in the JSON format above to a file named _EdgePort.json_ and run the following script:

```bash
curl -i -d "@EdgePort.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/system/port
```

2. After the REST command completes, restart Edge Data Store for the change to take effect.

## Configure Edge Data Store components

The default _System_Components.json_ file for the System component is the following. The Storage component is required for this initial release for Edge Data Store to run. With later releases of Edge Data Store, the storage component may not be required.

```json
[
  {
    "ComponentId": "Storage",
    "ComponentType": "EDS.Component"
  }
]
```

 You can add additional Modbus TCP and OPC UA components if you want, but only a single Storage component is supported. 

1. To add a new component, in this example a Modbus TCP EDS adapter, create the following JSON. 

**Note:** A unique ComponentId is necessary for each component in the system. This example uses the ComponentId Modbus1 since it is the first Modbus TCP EDS adapter:

 ```json
  {
    "ComponentId": "Modbus1",
    "ComponentType": "Modbus"
  }
 ```

2. Save the JSON in a file named _AddComponent.json_. 
3. From the same directory where the file exists, run the following curl script:

```bash
curl -i -d "@AddComponent.json" -H "Content-Type: application/json" -X POST http://localhost:5590/api/v1/configuration/system/components
```

After the curl command completes successfully, you can configure or use the new component.

## Entire Edge Data Store configuration

### Configure minimum Edge Data Store

The following JSON file represents minimal configuration of an Edge Data Store. There are no Modbus TCP or OPC UA components, and the Storage component configurations are set to the default. If you configure a system with this JSON file, any existing Modbus TCP or OPC UA components will be disabled and removed. No storage data will be deleted or modified, and OMF and SDS data access will not be impacted.

```json
{
  "Storage": {
    "PeriodicEgressEndpoints": [],
    "Runtime": {
      "streamStorageLimitMb": 2,
      "streamStorageTargetMb": 1,
      "ingressDebugExpiration": "0001-01-01T00:00:00",
      "checkpointRateInSec": 30,
      "transactionLogLimitMB": 250,
      "enableTransactionLog": true
    },
    "Logging": {
      "logLevel": "Information",
      "logFileSizeLimitBytes": 34636833,
      "logFileCountLimit": 31
    }
  },
  "System": {
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
}
```

- Save or copy the JSON in a file named _EdgeMinimumConfiguration.json_ in any directory on a device with Edge Data Store installed.

When you run the following curl command from the directory where the file exists, this will be set as the configuration of a running Edge Data Store (run the command from the directory where the file is located):

```bash
curl -i -d "@EdgeMinimumConfiguration.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration
```

The configuration takes effect immediately after the command completes.

The previous example results in a minimal configuration of Edge Data Store. It only supports [OMF](xref:omfQuickStart) and [SDS](xref:sdsQuickStart) operations using REST. No egress is configured, so no data will be forwarded to either [OCS](xref:ocsEgressQuickStart) or [PI Web API](xref:piEgressQuickStart).

## Configure maximum Edge Data Store

The following JSON file represents maximal configuration of an Edge Data Store. There are Modbus TCP and OPC UA components, and egress is configured to send to both PI Web API and OCS from both the default (operational data) and diagnostics (diagnostic data) namespace.

```json
{
    "Modbus1": {
        "Logging": {
            "logLevel": "Information",
            "logFileSizeLimitBytes": 34636833,
            "logFileCountLimit": 31
        },
        "DataSource": {
            "IpAddress": "<Modbus IP address>",
            "Port": 502,
            "ConnectTimeout": 15000,
            "ReconnectInterval": 5000,
            "RequestTimeout": 9000,
            "DelayBetweenRequests": 0,
            "MaxResponseDataLength": 250
        },
        "DataSelection": [{
                "Selected": "true",
                "UnitId": 1,
                "RegisterType": 3,
                "RegisterOffset": 1,
                "DataTypeCode": 20,
                "BitMap": "16151413",
                "ConversionFactor": 2,
                "ConversionOffset": 3.4,
                "ScanRate": 500
            },
            {
                "Selected": "true",
                "UnitId": 1,
                "RegisterType": 3,
                "RegisterOffset": 2,
                "DataTypeCode": 20,
                "BitMap": "16151413",
                "ConversionFactor": 2,
                "ConversionOffset": 3.4,
                "ScanRate": 500
            },
            {
                "Selected": "true",
                "UnitId": 1,
                "RegisterType": 3,
                "RegisterOffset": 3,
                "DataTypeCode": 20,
                "BitMap": "16151413",
                "ConversionFactor": 2,
                "ConversionOffset": 3.4,
                "ScanRate": 500
            },
            {
                "Selected": "true",
                "UnitId": 1,
                "RegisterType": 3,
                "RegisterOffset": 4,
                "DataTypeCode": 20,
                "BitMap": "16151413",
                "ConversionFactor": 2,
                "ConversionOffset": 3.4,
                "ScanRate": 500
            },
            {
                "Selected": "true",
                "UnitId": 1,
                "RegisterType": 3,
                "RegisterOffset": 5,
                "DataTypeCode": 20,
                "BitMap": "16151413",
                "ConversionFactor": 2,
                "ConversionOffset": 3.4,
                "ScanRate": 500
            }
        ]
    },
    "Storage": {
        "Runtime": {
            "streamStorageLimitMb": 2,
            "streamStorageTargetMb": 1,
            "ingressDebugExpiration": "0001-01-01T00:00:00"
        },
        "Logging": {
            "logLevel": "Information",
            "logFileSizeLimitBytes": 34636833,
            "logFileCountLimit": 31
        },
        "PeriodicEgressEndpoints": [{
                "Id": "OCS",
                "ExecutionPeriod": "00:00:50",
                "Name": null,
                "NamespaceId": "default",
                "Description": null,
                "Enabled": true,
                "Backfill": false,
                "EgressFilter": "",
                "StreamPrefix": "ChangeMe",
                "TypePrefix": "ChangeMe",
                "Endpoint": "<OCS OMF URL for your tenant and namespace>",
                "ClientId": "<OCS ClientId>",
                "ClientSecret": "<OCS ClientSecret>",
                "UserName": null,
                "Password": null,
                "DebugExpiration": null
            },
            {
                "Id": "PWA",
                "ExecutionPeriod": "00:00:50",
                "Name": null,
                "NamespaceId": "default",
                "Description": null,
                "Enabled": true,
                "Backfill": false,
                "EgressFilter": "",
                "StreamPrefix": "ChangeMe",
                "TypePrefix": "ChangeMe",
                "Endpoint": "https://<your PI Web API server>/piwebapi/omf/",
                "ClientId": null,
                "ClientSecret": null,
                "UserName": "<username>",
                "Password": "<password>",
                "DebugExpiration": null
            },
            {
                "Id": "OCSDiag",
                "ExecutionPeriod": "00:00:50",
                "Name": null,
                "NamespaceId": "diagnostics",
                "Description": null,
                "Enabled": true,
                "Backfill": false,
                "EgressFilter": "",
                "StreamPrefix": "ChangeMe",
                "TypePrefix": "ChangeMe",
                "Endpoint": "<OCS OMF URL for your tenant and namespace>",
                "ClientId": "<OCS ClientId>",
                "ClientSecret": "<OCS ClientSecret>",
                "UserName": null,
                "Password": null,
                "DebugExpiration": null
            },
            {
                "Id": "PWADiag",
                "ExecutionPeriod": "00:00:50",
                "Name": null,
                "NamespaceId": "diagnostics",
                 "Description": null,
                "Enabled": true,
                "Backfill": false,
                "EgressFilter": "",
                "StreamPrefix": "ChangeMe",
                "TypePrefix": "ChangeMe",
                "Endpoint": "https://<your PI Web API server>/piwebapi/omf/",
                "ClientId": null,
                "ClientSecret": null,
                "UserName": "<username>",
                "Password": "<password>",
                "DebugExpiration": null
            }
        ]
    },
    "OpcUa1": {
        "Logging": {
            "logLevel": "Information",
            "logFileSizeLimitBytes": 34636833,
            "logFileCountLimit": 31
        },
        "DataSource": {
            "EndpointUrl": "opc.tcp://<OPC UA server IP and port>/OSIsoftTestServer",
            "UseSecureConnection": false,
            "UserName": null,
            "Password": null,
            "RootNodeIds": null,
            "IncomingTimestamp": "Source",
            "StreamIdPrefix": "OpcUa"
        },
        "DataSelection": [{
                "Selected": true,
                "Name": "Cold Side Inlet Temperature",
                "NodeId": "ns=2;s=Line1.HeatExchanger1001.ColdSideInletTemperature",
                "StreamId": null
            },
            {
                "Selected": false,
                "Name": "Cold Side Outlet Temperature",
                "NodeId": "ns=2;s=Line1.HeatExchanger1001.ColdSideOutletTemperature",
                "StreamId": null
            },
            {
                "Selected": true,
                "Name": "Hot Side Inlet Temperature",
                "NodeId": "ns=2;s=Line1.HeatExchanger1001.HotSideInletTemperature",
                "StreamId": null
            },
            {
                "Selected": true,
                "Name": "Hot Side Outlet Temperature",
                "NodeId": "ns=2;s=Line1.HeatExchanger1001.HotSideOutletTemperature",
                "StreamId": null
            },
            {
                "Selected": true,
                "Name": "Cold Side Inlet Temperature",
                "NodeId": "ns=2;s=Line1.HeatExchanger1002.ColdSideInletTemperature",
                "StreamId": null
            },
            {
                "Selected": false,
                "Name": "Cold Side Outlet Temperature",
                "NodeId": "ns=2;s=Line1.HeatExchanger1002.ColdSideOutletTemperature",
                "StreamId": null
            },
            {
                "Selected": false,
                "Name": "Hot Side Inlet Temperature",
                "NodeId": "ns=2;s=Line1.HeatExchanger1002.HotSideInletTemperature",
                "StreamId": null
            },
            {
                "Selected": true,
                "Name": "Hot Side Outlet Temperature",
                "NodeId": "ns=2;s=Line1.HeatExchanger1002.HotSideOutletTemperature",
                "StreamId": null
            },
            {
                "Selected": false,
                "Name": "Power",
                "NodeId": "ns=2;s=Line1.SF_Pump_001.Power",
                "StreamId": null
            },
            {
                "Selected": false,
                "Name": "Efficiency",
                "NodeId": "ns=2;s=Line1.SF_Pump_001.Efficiency",
                "StreamId": null
            },
            {
                "Selected": false,
                "Name": "Flowrate",
                "NodeId": "ns=2;s=Line1.SF_Pump_001.Flowrate",
                "StreamId": null
            },
            {
                "Selected": false,
                "Name": "Power",
                "NodeId": "ns=2;s=Line1.SF_Pump_002.Power",
                "StreamId": null
            },
            {
                "Selected": false,
                "Name": "Efficiency",
                "NodeId": "ns=2;s=Line1.SF_Pump_002.Efficiency",
                "StreamId": null
            },
            {
                "Selected": false,
                "Name": "Flowrate",
                "NodeId": "ns=2;s=Line1.SF_Pump_002.Flowrate",
                "StreamId": null
            },
            {
                "Selected": false,
                "Name": "Level",
                "NodeId": "ns=2;s=Line1.Tank1.Level",
                "StreamId": null
            },
            {
                "Selected": false,
                "Name": "Mass",
                "NodeId": "ns=2;s=Line1.Tank1.Mass",
                "StreamId": null
            },
            {
                "Selected": false,
                "Name": "Volume",
                "NodeId": "ns=2;s=Line1.Tank1.Volume",
                "StreamId": null
            },
            {
                "Selected": false,
                "Name": "Level",
                "NodeId": "ns=2;s=Line1.Tank2.Level",
                "StreamId": null
            },
            {
                "Selected": false,
                "Name": "Mass",
                "NodeId": "ns=2;s=Line1.Tank2.Mass",
                "StreamId": null
            },
            {
                "Selected": false,
                "Name": "Volume",
                "NodeId": "ns=2;s=Line1.Tank2.Volume",
                "StreamId": null
            }
        ]
    },
    "System": {
        "Logging": {
            "logLevel": "Information",
            "logFileSizeLimitBytes": 34636833,
            "logFileCountLimit": 31
        },
        "Components": [{
                "componentId": "OpcUa1",
                "componentType": "OpcUa"
            },
            {
                "componentId": "Modbus1",
                "componentType": "Modbus"
            },
            {
                "componentId": "Storage",
                "componentType": "EDS.Component"
            }
        ],
        "HealthEndpoints": [],
        "Port": {
            "port": 5590
        }
    }
}
```

1. Fill in any credentials or IP addresses with appropriate values for your environment.
2. Save the edited version of the previous JSON in a file named _EdgeMaximumConfiguration.json_ in any directory. 

If you run the following curl command, this will be set as the configuration of a running Edge Data Store (You should run the command from the same directory where the file is located):

```bash
curl -i -d "@EdgeMaximumConfiguration.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration
```

The configuration takes effect immediately after the command completes.

Full JSON definition of configuration parameters:
[Edge Data Store Configuration](xref:edge_system_schema)
