---
uid: modbusOverview
---

# Modbus TCP EDS adapter

## Overview

The Modbus TCP EDS adapter is a component of Edge Data Store that transfers time-series data from a device to EDS. Modbus TCP is a commonly available communication protocol used for connecting and transmitting information between industrial electronic devices. The Modbus TCP EDS adapter can communicate with any device conforming to the Modbus TCP/IP protocol through a gateway or router; devices and routers do not need to be on the same subnet as Edge Data Store. The Modbus TCP EDS adapter polls devices to capture data, at the rate specified in the configuration.

The Modbus TCP EDS adapter is installed as part of the Edge Data Store installation and manually configured with JSON documents that specify the following:

  * System components configuration – defines the storage and ingress components, including Modbus TCP EDS adapter type components. A single adapter component can only connect to a single device, which means a separate adapter component is needed to connect to each individual device.

  * Data source configuration - identifies the device from which the data originates, specifies the security for the connection, and controls how the data streams from that device identified. Each adapter component requires a data source configuration.
  
  * Data selection configuration - specifies what data is collected from the device and how it is identified. Each adapter component requires a data selection configuration.
  
