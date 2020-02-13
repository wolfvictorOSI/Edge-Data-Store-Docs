---
uid: opcUaOverview
---

# OPC UA EDS adapter

## Overview

The OPC UA EDS adapter is a component of Edge Data Store that transfers time-series data from an OPC UA capable device to EDS. OPC Unified Architecture (OPC UA) is a machine to machine communication protocol for industrial automation developed by the OPC Foundation. The OPC UA EDS adapter can connect to any device that uses the OPC UA communication protocol and uses subscriptions to reduce the amount of data transferred by only reading data changes and events. Once the data from the device is transferred to EDS, it is stored locally until it can be sent to a PI System or OSIsoft Cloud Services for long-term storage and analysis. 

A single OPC UA EDS adapter can be installed as part of the Edge Data Store installation and, once configured, can connect to a single device. To connect to multiple devices, install and configure an additional instance of the OPC UA EDS adapter for each device.  

Use JSON documents to configure the data source and data selection for each OPC UA EDS adapter. The data source configuration identifies the device from which the data originates, specifies the security for the connection, and controls how the data streams from that device identified. The data selection configuration controls what data is collected from the device and how it is identified. For each data item identified in the data selection configuration, one data stream is created in EDS and sent to the storage component based on the storage runtime configuration. 

