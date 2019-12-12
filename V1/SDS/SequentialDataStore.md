---
uid: sdsOverview
---

# Sequential Data Store (SDS)

The Edge Data Store includes the Sequential Data Store (SDS) REST APIs for [reading](xref:sdsReadingData) and [writing](xref:sdsWritingData) data stored locally on the device where the Edge Data Store is running. SDS is the same technology used in OCS for storing data, so the usage of the REST APIs is very similar to OCS for reading and writing data.

All data from all sources on the Edge Data Store (Modbus, OPC UA, OMF, SDS) can be read using the SDS REST APIs on the local device, in the default tenant and the default namespace. In addition, the default tenant has a diagnostics namespace where diagnostic data are written by the Edge Data Store and installed components that can be read to monitor the health of a running system using the SDS REST APIs.

The SDS instance running in EDS is an advanced storage engine that is also used in OCS. While it works very well for storing OMF compatible data in EDS, it can also be used for advanced scenarios where data stored in SDS cannot be converted to OMF. All data egress from EDS to both OCS and the PI System uses OMF in this release of EDS, so for streams that will be egressed to the PI System or OCS, it is recommended that they have only a single time based index. Multiple values are supported in a single stream, but for successful egress there is a limitation in this release of a single time based index only.

* [SDS Reading Data APIs](xref:sdsReadingDataApi)

* [SDS Reading Data](xref:sdsReadingData)

* [SDS Writing Data](xref:sdsWritingData)

* [SDS Writing Data APIs](xref:sdsWritingDataApi)

* [Compression](xref:sdsCompression)

* [SDS Filter Expressions](xref:sdsFilterExpressions)

* [SDS Streams](xref:sdsStreams)

* [SDS Types](xref:sdsTypes)

* [SDS Views](xref:sdsStreamViews)

* [SDS Stream Metadata](xref:sdsStreamExtra)

* [SDS Table Format](xref:sdsTableFormat)

* [SDS Searching](xref:sdsSearching)

* [SDS Units of Measure](xref:unitsOfMeasure)
