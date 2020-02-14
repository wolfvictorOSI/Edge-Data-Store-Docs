---
uid: opcUaOverview
---

# OPC UA EDS adapter

## Overview

The OPC UA EDS adapter is a component of Edge Data Store that transfers time-series data from an OPC UA capable device to EDS. OPC Unified Architecture (OPC UA) is a machine to machine communication protocol for industrial automation developed by the OPC Foundation. The OPC UA EDS adapter can connect to any device that uses the OPC UA communication protocol and uses subscriptions to reduce the amount of data transferred by only reading data changes and events. Once the data from the device is transferred to EDS, it is stored locally until it can be sent to a PI System or OSIsoft Cloud Services for long-term storage and analysis. 

The OPC UA EDS adapter is installed as part of the Edge Data Store installation and manually configured with JSON documents that specify the following:

  * System components configuration – defines the storage and ingress components, including OPC UA EDS adapter type components. A single adapter component can only connect to a single device, which means a separate adapter component is needed to connect to each individual device.

  * Data source configuration - identifies the device from which the data originates, specifies the security for the connection, and controls how the data streams from that device identified. Each adapter component requires a data source configuration.
  
  * Data selection configuration - specifies what data is collected from the device and how it is identified. Each adapter component requires a data selection configuration.


