---
uid: index
---

# Edge Data Store

Edge Data Store (EDS) is a lightweight application designed to capture and store operational data at the edge of networks in remote locations that may not be continuously connected. EDS augments the PI System by providing historical data access in situations where deploying a full PI System is impractical. Once data is collected, it is stored locally until it can be sent to a PI System or OSIsoft Cloud Services (OCS) for long-term storage and analysis.

EDS provides the following capabilities:

- OSIsoft Message Format (OMF) data ingress
- Edge connectivity through Modbus TCP and OPC UA
- Configurable data storage
- OMF data egress to PI Web API and OSIsoft Cloud Services
- REST API to enable custom applications for visualization and analytics on Edge Data Store

## Edge Data Store architecture

EDS is designed for small devices, such as 64-bit Intel/AMD compatible, 32-bit ARM v7/v8 compatible, and 64-bit ARM v8 compatible chips,  running Linux and Windows. The following diagram depicts the relationships of architectural components to one another in the Edge Data Store:

![EDS architecture](https://osisoft.github.io/Edge-Data-Store-Docs/V1/images/EDSArchitecture.jpg "EDS architecture")

## Edge Data Store data flow

The following diagram depicts the flow of data in the Edge Data Store:

![EDS data flow](https://osisoft.github.io/Edge-Data-Store-Docs/V1/images/EDSOverview1.jpg "EDS data flow")

Modbus TCP EDS adapters and OPC UA EDS adapters collect data from devices and store it in a storage component based on sequential data storage technology. OMF data ingress collects data from other sources and stores in the storage component. Sequential Data Store (SDS) REST APIs can also read and write data to the storage component. The collected operational data, as well as system health data, is then sent to the PI System or OCS.

## Edge Data Store components

The following diagram depicts the relationship of key functions to relevant components of the Edge Data Store:

![EDS components](https://osisoft.github.io/Edge-Data-Store-Docs/V1/images/EDSOverview2.jpg "EDS components")

## Data ingress to Edge Data Store

Edge Data Store can ingress data in a number of ways. There are two built-in adapters: Modbus TCP EDS adapter and OPC UA EDS adapter. Data can also be ingressed using OSIsoft Message Format (OMF) and the Sequential Data Store (SDS) REST APIs.

The following diagram depicts an OMF data ingress scenario in the Edge Data Store:

![EDS OMF Ingress](https://osisoft.github.io/Edge-Data-Store-Docs/V1/images/EDSOMFIngress.jpg "EDS OMF Ingress")

During installation of Edge Data Store, you can choose to install either a Modbus TCP EDS adapter or an OPC UA EDS adapter, or both. The Modbus TCP and OPC UA EDS adapters require configuration of data source and data selection before they can collect data in Edge Data Store. You can use OMF data ingress once Edge Data Store is installed, with no further configuration steps.

Edge Data Store is composed of components, and is designed to allow additional EDS adapters at a later point.

## Local data read and write access

You can access all data in Edge Data Store by using the Sequential Data Store (SDS) REST API. You can use this data for local applications that perform analytics or visualization.

### Example EDS visualization application

The following diagram depicts the flow of data from a customer visualization application into Edge Data Store, via either OMF or SDS REST calls:

![EDS Visualization](https://osisoft.github.io/Edge-Data-Store-Docs/V1/images/EDSVisualization.jpg "EDS Visualization")

### Example EDS analytics application

The following diagram depicts the flow of data from a customer analytics application into Edge Data Store, via either OMF or SDS REST calls:

![EDS Analytics](https://osisoft.github.io/Edge-Data-Store-Docs/V1/images/EDSAnalytics.jpg "EDS Analytics")

## Data egress from Edge Data Store

Edge Data Store can send data to both PI Data Archive and OSIsoft Cloud Services (OCS) using PI Web API. After Edge Data Store is installed, additional configuration is necessary to send data to either OCS and PI Web API.

For information about configuring or using a component of EDS, see the corresponding quick start guide for that component.

<!--
# OSIsoft Edge Data Store

=======

- [Overview](xref:EdgeDataStoreOverview)
  - [Design considerations](xref:scalePerformance)
  - [Security](xref:security)
- [Quick start guides](xref:QuickStartGuides)
  - [OPC UA EDS adapter quick start](xref:opcUaQuickStart)
  - [Modbus TCP adapter quick start](xref:modbusQuickStart)
  - [OMF quick start](xref:omfQuickStart)
  - [OCS egress quick start](xref:ocsEgressQuickStart)
  - [PI egress quick start](xref:piEgressQuickStart)
  - [SDS Read/Write quick start](xref:sdsQuickStart)
  - [Command line quick start - Linux](xref:commandLineLinuxQuickStart)
  - [Command line quick start - Windows](xref:commandLineWindowsQuickStart)
- [Installation](xref:installationOverview)
  - [System requirements](xref:SystemRequirements)
    - [Linux and Windows platform differences](xref:linuxWindows)
  - [Install Edge Data Store](xref:InstallEdgeDataStore)
    - [Docker](xref:edgeDocker)
  - [Verify installation](xref:VerifyInstallation)
  - [Uninstall Edge Data Store](xref:UninstallEdgeDataStore)
- [EdgeCmd utility](xref:commandLine)
  - [Install EdgeCmd utility](xref:Installedgecmd)
- [Configuration](xref:Configuration)
  - [Configuration tools](xref:ConfigurationTools)
  - [System configuration](xref:SystemConfiguration)
    - [System components configuration](xref:SystemComponentsConfiguration)
    - [System port configuration](xref:SystemPortConfiguration)
    - [Edge Data Store configuration](xref:EdgeDataStoreConfiguration)
  - [Data ingress configuration](xref:EDSDataIngress)
    - [OPC UA EDS adapter](xref:opcUaOverview)
      - [Supported features](xref:SupportedFeaturesOPCUA)
      - [Principles of operation](xref:PrinciplesOfOperationOPCUA.md)
      - [Data source configuration](xref:OPCUADataSourceConfiguration)
      - [Data selection configuration](xref:OPCUADataSelectionConfiguration)
      - [Adapter security](xref:OPCUAAdapterSecurityConfiguration)
    - [Modbus TCP EDS adapter](xref:modbusOverview)
      - [Supported features](xref:SupportedFeaturesModbus)
      - [Principles of operation](xref:PrinciplesOfOperationModbus)
      - [Data source configuration](xref:ModbusTCPDataSourceConfiguration)
      - [Data selection configuration](xref:ModbusTCPDataSelectionConfiguration)
    - [OSIsoft Message Format (OMF)](xref:omfOverview)
  - [Storage](xref:storage)
    - [Storage runtime configuration](xref:storageruntime)
  - [Data egress configuration](xref:egress)
    - [Prepare egress destinations](xref:PrepareEgressDestinations)
    - [Egress execution details](xref:EgressExecutionDetails)
  - [Diagnostics configuration](xref:EdgeDataStoreDiagnostics)
  - [Health endpoints configuration](xref:HealthEndpointsConfiguration)
  - [Logging configuration](xref:LoggingConfig)
- [Administration](xref:EdgeDataStoreAdministration)
  - [Retrieve product version information](xref:RetrieveProductVersionInformation)
  - [Reset Edge Data Store](xref:ResetEdgeDataStore)
  - [Reset the Storage component](xref:ResetTheStorageComponent)
  - [Stop and start an EDS adapter](xref:StopAndStartAnEDSAdapter)
- [Troubleshoot Edge Data Store](xref:troubleShooting)
  - [Disaster recovery](xref:disasterRecovery)
- [Reference](xref:Reference)
  - [Sequential Data Store (SDS)](xref:sdsOverview)
    - [Types](xref:sdsTypes)
    - [Streams](xref:sdsStreams)
    - [Stream views](xref:sdsStreamViews)
    - [Indexes](xref:sdsIndexes)
    - [Writing data](xref:sdsWritingData)
      - [API calls for writing data](xref:sdsWritingDataApi)
    - [Reading Data](xref:sdsReadingData)
      - [API calls for reading data](xref:sdsReadingDataApi)
      - [Filter expressions](xref:sdsFilterExpressions)
      - [Table format](xref:sdsTableFormat)
    - [Units of measure](xref:unitsOfMeasure)
    - [Compression](xref:sdsCompression)
    - [Searching](xref:sdsSearching)
  - [EdgeCmd commands](xref:EdgecmdCommands)
  - [Release Notes](xref:releaseNotes)
-->
