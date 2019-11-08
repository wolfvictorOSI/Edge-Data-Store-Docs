---
uid: opcUaOverview
---

# OPC UA EDS adapter

## Overview

OPC UA is an open standard, which ensures interoperability, security, and reliability of industrial automation devices and systems. OPC UA is recognized as one of the key communication and data modeling technologies of Industry 4.0, due to the fact that it works with many software platforms, and is completely scalable and flexible.

The OPC UA EDS adapter transfers time-series data from OPC UA devices into Edge Data Store.

You can add a single OPC UA EDS adapter during installation. If you want multiple OPC UA EDS adapters, see [Edge Data Store configuration](xref:EdgeDataStoreConfiguration) on how to add a new component to Edge Data Store.

As with other EDS adapters, the OPC UA EDS adapter is configured with data source and data selection JSON documents. The data source configurations are identical with other adapters, but OPC UA supports an option to generate a data selection file template that you can manually edit and use for subsequent configuration. See [OPC UA data selection](xref:opcUaDataSelection) for details. Once you create a template file, you can reuse it on both Linux and Windows without changes.


