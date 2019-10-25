---
uid: modbusOverview
---

# Modbus TCP EDS adapter

## Overview

Modbus TCP is a commonly available communication protocol used for connecting and transmitting information between industrial electronic devices. The Modbus TCP adapter polls Modbus TCP slave devices, and transfers time series data from the data source devices into Edge Data Store. Polling is based on the measurement configuration provided, and models the register measurements in a Modbus TCP data source.

The Modbus TCP adapter communicates with any device conforming to the Modbus TCP/IP protocol through a gateway or router. The Modbus TCP slave devices and routers do not need to be on the same subnet as Edge Data Store.

To install a Modbus TCP EDS adapter, see [Edge Data Store Configuration](xref:EdgeDataStoreConfiguration) on how to add a new component to Edge Data Store. The example below covers configuring a EDS adapter named Modbus1. If another EDS adapter has been installed, please substitute the name of the installed adapter in the following example for Modbus1.
