---
uid: modbusOverview
---

# Modbus TCP EDS adapter

## Overview

The Modbus TCP EDS adapter is a component of Edge Data Store that transfers time-series data from a device to EDS. Modbus TCP is a commonly available communication protocol used for connecting and transmitting information between industrial electronic devices. The Modbus TCP EDS adapter communicates with any device conforming to the Modbus TCP/IP protocol through a gateway or router. The Modbus TCP slave devices and routers do not need to be on the same subnet as Edge Data Store. The Modbus TCP EDS adapter polls Modbus TCP slave devices to capture data. Polling is based on the measurement configuration provided, and models the register measurements in a Modbus TCP data source.

A single Modbus TCP EDS adapter can be installed as part of the Edge Data Store installation and, once configured, can connect to a single device. To connect to multiple devices, install and configure an additional instance of the Modbus TCP EDS adapter for each device.

Use JSON documents to configure the data source and data selection for each Modbus TCP EDS adapter. The data source configuration identifies the device from which the data originates, specifies how the adapter polls the device, and controls how the data streams from that device are identified. The data selection configuration controls what data is collected and how it is identified. For each data item identified in the data selection configuration, one data stream is created in EDS and sent to the storage component based on the storage runtime configuration. 

