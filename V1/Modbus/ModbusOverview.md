---
uid: modbusOverview
---

# Modbus TCP adapter

## Overview

Modbus TCP is a commonly available communication protocol used for connecting and transmitting information between industrial electronic devices. The Modbus TCP adapter polls Modbus TCP slave devices, and transfers time series data from the data source devices into Edge Data Store. Polling is based on the measurement configuration provided, and models the register measurements in a Modbus TCP data source.

The Modbus TCP adapter communicates with any device conforming to the Modbus TCP/IP protocol through a gateway or router. The Modbus slave devices and routers do not need to be on the same subnet as Edge Data Store.

To install a Modbus EDS adapter, see [Edge Data Store Configuration](xref:EdgeDataStoreConfiguration) on how to add a new component to Edge Data Store. The example below covers configuring a EDS adapter named Modbus1. If another EDS adapter has been installed, please substitute the name of the installed adapter in the following example for Modbus1.

## Supported features
### Register types
The Modbus EDS adapter supports the following types of operations on registers of the Modbus devices:

 - Read Coil Status (Function code 01)
 - Read Discrete Input Status (Function code 02)
 - Read Holding Registers (Function code 03)
 - Read Input Registers (Function code 04)

When reading from function codes **01** and **02** the adapter expects these to be returned as single bits. For function codes **03** and **04**, the adapter expects 16 bits to be returned from devices that contain 16-bit registers and 32 bits to be returned from devices that contain 32-bit registers.

### Data types
The Modbus EDS adapter converts readings from single or multiple registers into the data types specified by the data type code and populates the value into streams created in the Edge Data Store.

The following table lists all data types with their corresponding type codes supported by the Modbus EDS adapter.

| Data type code | Data type name | Value type | Register type | Description |
|----------------|----------------|------------|---------------|-------------|
| 1              | Boolean        | Bool       | Bool          | 0 = false <br> 1 = true
| 10             | Int16          | Int16      | Bool/16-bit   | Read 1 Modbus register and interpret as a 16-bit integer. Bytes [BA] read from the device are stored as [AB]. |
| 20             | UInt16         | UInt16     | Bool/16-bit   | Read 1 Modbus register and interpret as an unsigned 16-bit integer. Bytes [BA] read from the device are stored as [AB]. |
| 30             | Int32          | Int32      | 16-bit/32-bit | Read 32 bits from the Modbus device and interpret as a 32-bit integer. Bytes [DCBA] read from the device are stored as [ABCD]. |
| 31             | Int32ByteSwap  | Int32      | 16-bit/32-bit | Read 32 bits from the Modbus device and interpret as a 32-bit integer. Bytes [BADC] read from the device are stored as [ABCD]. |
| 100            | Float32        | Float32    | 16-bit/32-bit | Read 32 bits from the Modbus device and interpret as a 32-bit float. Bytes [DCBA] read from the device are stored as [ABCD]. |
| 101            | Float32ByteSwap | Float32   | 16-bit/32-bit | Read 32 bits from the Modbus device and interpret as a 32-bit float. Bytes [BADC] read from the device are stored as [ABCD]. |
| 110            | Float64        | Float64    | 16-bit/32-bit | Read 64 bits from the Modbus device and interpret as a 64-bit float. Bytes [HGFEDCBA] read from the device are stored as [ABCDEFGH]. |
| 111            | Float64ByteSwap | Float64   | 16-bit/32-bit | Read 64 bits from the Modbus device and interpret as a 64-bit float. Bytes [BADCFEHG] read from the device are stored as [ABCDEFGH]. |
| 1001 - 1250    | String         | String     | 16-bit/32-bit | 1001 reads a one-character string, 1002 reads a two-character string, and 1003 reads a three-character string and so on. Bytes [AB] are interpreted as "AB". |
| 2001 - 2250    | StringByteSwap | String     | 16-bit/32-bit | 2001 reads a one-character string, 2002 reads a two-character string, and 2003 reads a three-character string and so on. Bytes [BA] are interpreted as "AB". |

### Apply bitmap
The Modbus EDS adapter supports applying bitmaps to the value converted from the readings from the Modbus devices. A bitmap is a series of numbers used to extract and reorder bits from a word register. The format of the bitmap is uuvvwwxxyyzz, where uu, vv, ww, yy, and zz each refer to a single bit. A leading zero is required if the referenced bit is less than 10. The low-order bit is 01 and high-order bit is either 16 or 32. Up to 16 bits can be referenced for a 16-bit word (data types 10 and 20) and up to 32 bits can be referenced for a 32-bit word (data type 30 and 31). For example, the bitmap 0307120802 will map the second bit of the original word to the first bit of the new word, the eighth bit to the second bit, the twelfth bit to the third bit, and so on. The high-order bits of the new word are padded with zeros if they are not specified. 

Not all data types support applying bitmap. The data types supporting bitmap are: 
 - Int16 (Data type code 10) 
 - UInt16 (Data type code 20)
 - Int32 (Data type code 30 and 31) 
 
 ### Apply data conversion 
 
 The Modbus EDS adapter supports applying data conversion to the value converted from reading from the Modbus devices. A conversion factor and conversion offset can be specified. The conversion factor is used for scaling up or down the value, and the conversion offset is used for shifting the value. The mathematical equation used in conversion is the following: 

 ```
 <After Conversion> = <Before Conversion> / Factor - Offset 
 ```

 Not all data types support applying data conversion. The data types supporting data conversion are: 
 - Int16 (Data type code 10) 
 - UInt16 (Data type code 20) 
 - Int32 (Data type code 30 and 31) 
 - Float32 (Data type code 100 and 101) 

 The value with data conversion applied will always be converted to the 32-bit float type to maintain the precision of the conversion factor and conversion offset.

## Principles of operation
The following topics provide an operational overview of the Modbus EDS adapter, focusing on streams creation and error handling. 

### Operational overview

#### Adapter configuration
In order to provide the necessary information for the EDS Modbus TCP adapter to be ready for data collection, you need to configure the adapter. For more details, see **Configuration of Modbus data source** and **Configuration of Modbus data selection**. To configure the adapter, do the following:
- Data source: Provide the information of the data sources from which the connector pulls data
- Data selection: Provide the selected measurements for which the adapter collects data from the data source
- Logging: Set up the logging attributes to manage the adapter logging behavior

#### Network communication
The Modbus EDS adapter communicates with the Modbus devices through the TCP/IP network by sending request packets that are constructed based on the data selection configurations, and collects the response packets returned by the devices. 

#### Stream creation
From the parsed data selection configurations, the Modbus EDS adapter creates types, streams and data based on the information provided. For each measurement in the data selection configuration, a stream is created in the Edge Data Store to store time series data.

#### Data collection
The Modbus EDS adapter collects data from the Modbus devices at the polling rates that you specify. The rates are set in each of the data selection configurations and can range from 0 milliseconds (as fast as possible) up to 1 day per polling. The adapter automatically optimizes the data collection process by grouping the requests to reduce the I/O load imposed to the Modbus networks.

### Streams by Modbus EDS adapter
For each data selection configuration, the Modbus EDS adapter creates a stream with two properties. The properties are defined in the following table:
| Property name | Data type | Description |
|---------------|-----------|-------------|
| Timestamp     | String    | The response time of the stream data from the Modbus device. |
| Value         | Specified by the data selection | The value of the stream data from the Modbus device. | 

There is a unique identifier (Stream ID) for each stream created for the selected measurement. If a custom stream ID is specified for the measurement in the data selection configuration, the Modbus EDS adapter will use that stream ID to create the stream. Otherwise, the connector constructs the stream ID using the following format: 
```
<Adapter Component ID>.<Unit ID>.<Register Type>.<Register Offset> 
```


## Modbus TCP data source configuration

To use the Modbus TCP EDS adapter Adapter of Edge Data Store, you must configure it for the Modbus data source from which it will be polling data.

### Configure Modbus TCP data source

Complete the following to configure the Modbus data source:

1. Using any text editor, create a file that contains a Modbus TCP data source in JSON form. 
You can create or copy this file to any directory on a device with Edge Data Store installed.
    - For content structure, see [Modbus TCP data source example](#modbus-tcp-data-source-example). 
    - For a table of all available parameters, see [Parameters for Modbus TCP data source](#parameters-for-modbus-tcp-data-source). 
2. Save the file as _DataSource.config.json_.
3. Use any [tool](xref:managementTools) capable of making HTTP requests to execute a POST command with the contents of that file to the following endpoint: `http://localhost:5590/api/v1/configuration/<EDS adapterId>/DataSource/`. If a Modbus EDS adapter is added during installation, it will have an EDS adapterId of Modbus1, which is used in the following example.

Example using cURL (run this command from the same directory where the file is located):

  ```bash
  curl -v -d "@DataSource.config.json" -H "Content-Type: application/json" -X POST "http://localhost:5590/api/v1/configuration/Modbus1/DataSource"
  ```

### Parameters for Modbus TCP data source

The following parameters are available for configuring a Modbus TCP data source.

| Parameter                |Required       | Type      | Description  |
|--------------------------|-----------|-----------|---------------------------------------------------|
| **IpAddress**             | Required  | string    | The IP address of the device from which the data is to be collected using the Modbus protocol. Host name is not supported. |
| **Port**                  | Optional  | number | The TCP port of the target device that listens for and responds to Modbus requests. The value ranges from 0 to 65535. If not configured, the default TCP port is 502 (which is the default port for Modbus protocol). |
| **StreamIdPrefix**        | Optional          | number | Parameter applied to all data items collected from the data source. If not configured, the default value is the ID of the Modbus EDS adapter. The custom StreamIdPrefix has the highest priority.|
| **ApplyPrefixToStreamId** | Optional          | boolean | Parameter applied to all data items collected from the data source that have custom stream ID configured. If configured, the adapter will apply the StreamIdPrefix property to all the streams with custom ID configured. The property does not affect any streams with default ID configured|
| **ConnectTimeout**        | Optional          | number  | Parameter to specify the time (in milliseconds) to wait when Modbus TCP EDS adapter is trying to connect to the data source. The value ranges from 1000 ms to 30000 ms. The default value is 5000 ms.|
| **ReconnectInterval**     | Optional          | number  | Parameter to specify the time (in milliseconds) to wait before retrying to connect to the data source when the data source is offline. The value ranges from 100 ms to 30000 ms. The default value is 1000 ms. |
|**RequestTimeout**         | Optional          | number  |Parameter to specify the time (in milliseconds) that Modbus TCP EDS adapter waits for a pending request before marking it as timeout and dropping the request. The default value is 10000 ms. The value must be a positive integer, there is no value range.|
|**DelayBetweenRequests**   | Optional          |number|Parameter to specify the minimum time (in milliseconds) between two successive requests sent to the data source. The value ranges from 0 ms to 1000 ms. The default value is 0 ms.|
|**MaxResponseDataLength**  | Optional          |number    |Parameter to limit the maximum length (in bytes) of data that can be read within one transaction. This feature is provided to support devices that limit the number of bytes that can be returned. If there is no device limitation, the request length should be the maximum length of 250 bytes. The value ranges from 2 to 250. The default value is 250 ms.|


### Modbus TCP data source example

The following is an example of valid Modbus TCP data source configuration:

```json
{
    "IpAddress": "117.23.45.110",
    "Port" : 502,
    "ConnectTimeout" : 10000,
    "StreamIdPrefix" : "DataSource1",
}
```

## Modbus TCP data selection configuration

Once a data source is configured for a Modbus instance, you must configure which data is to be collected from the Modbus TCP slave device.

### Configure Modbus TCP data selection

Complete the following to configure Modbus TCP data selection:

1. Using any text editor, create a file that contains a Modbus TCP data selection in JSON form. This file can be created or copied to any directory on a device with Edge Data Store installed.
    - For content structure, see [Modbus TCP data selection example](#modbus-tcp-data-selection-example). 
    - For a table of all available parameters, see [Parameters for Modbus TCP data selection](#parameters-for-modbus-tcp-data-selection). 
2. Save the file as _DataSelection.config.json_.
3. Use any [tool](xref:managementTools) capable of making HTTP requests to execute a POST command with the contents of that file to the following endpoint: `http://localhost:5590/api/v1/configuration/<EDS adapterId>/DataSelection/`.
Example using cURL (run this command from the same directory where the file is located):

```bash
curl -v -d "@DataSelection.config.json" -H "Content-Type: application/json" -X POST "http://localhost:5590/api/v1/configuration/<EDS adapterId>/DataSelection"
```

### Parameters for Modbus TCP data selection

The following parameters are available for configuring Modbus data selection.

| Parameter | Required | Type | Description |
|-----------|----------|------|-------------|
| **Id** | Optional | String | This field is used to update an existing measurement. The ID automatically updates when there are changes to the measurement and will follow the format of `<UnitId`>.`<RegisterType`>.`<RegisterOffset`>.
| **Selected** | Optional | bool | This field is used to select or clear a measurement. To select an item, set to true. To remove an item, leave the field empty or set to false.  If not configured, the default value is true.|
| **Name** | Optional | string | The optional friendly name of the data item collected from the data source. If not configured, the default value will be the stream ID. |
| **UnitId** | Required | number | Modbus TCP slave device unit ID. This must be a value between 0 and 247, inclusively. |
| **RegisterType** | Required | number or string | Modbus register type. Supported types are Coil, Discrete, Input16, Input32, Holding16 and Holding32.<br><br>Input16 and Holding16 are used to read registers that have a size of 16 bits. For registers that have a size of 32 bits, use the Input32 and Holding32 register types. To represent the types, you can type in the register type ID or the exact name: <br><br>1 or Coil (Read Coil Status)<br>2 or Discrete (Read Discrete Input Status)<br>3 or Holding16 (Read 16-bit Holding Registers)<br>4 or Holding32 (Read 32-bit Holding Registers)<br>6 or Input16 (Read 16-bit Input Registers)<br>7 or Input32 (Read 32-bit Input Registers) |
| **RegisterOffset** | Required | number | The 0 relative offset to the starting register for this measurement. For example, if your Holding registers start at base register 40001, the offset to this register is 0. For 40002, the offset to this register is 1.|
| **DataTypeCode** | Required | number | An integer representing the data type that Modbus TCP EDS adapter will read starting at the register specified by the offset. Supported data types are:<br>1 = Boolean<br>10 = Int16<br>20 = UInt16<br>30 = Int32<br>31 = Int32ByteSwap<br>100 = Float32<br>101 = Float32ByteSwap<br>110 = Float64<br>111 = Float64ByteSwap<br>1001 - 1250 = String <br>2001 - 2250 = StringByteSwap |
| **ScanRate** | Required | number | How often this measurement should be read from the device in milliseconds. Acceptable values are from 0 to 86400000. If 0 ms is specified, Modbus TCP EDS adapter will scan for data as fast as possible.|
| **BitMap** | Required | string | The bitmap is used to extract and reorder bits from a word register. The format of the bitmap is uuvvwwxxyyzz, where uu, vv, ww, yy, and zz each refer to a single bit. A leading zero is required if the referenced bit is less than 10. The low-order bit is 01 and high-order bit is either 16 or 32. Up to 16 bits can be referenced for a 16-bit word (data types 10 and 20) and up to 32 bits can be referenced for a 32-bit word (data type 30 and 31). The bitmap 0307120802 will map the second bit of the original word to the first bit of the new word, the eighth bit to the second bit, the twelfth bit to the third bit, and so on. The high-order bits of the new word are padded with zeros if they are not specified. |
| **ConversionFactor** | Required | number | This numerical value can be used to scale the raw response received from the Modbus TCP device. If this is specified, regardless of the specified data type, the value will be promoted to a float32 (single) when stored. [Result = (Value / Conversion Factor)] |
| **ConversionOffset** | Required | number | This numerical value can be used to apply an offset to the response received from the Modbus TCP device. If this is specified, regardless of the specified data type, the value will be promoted to a float32 (single) when stored.  [Result = (Value - Conversion Offset)] |
| **StreamID** | Required | string | The custom stream ID that will be used to create the streams. If not specified, the Modbus TCP adapter will generate a default stream ID based on the measurement configuration. A properly configured custom stream ID follows these rules:<br><br>Is not case-sensitive.<br>Can contain spaces.<br>Cannot start with two underscores ("__").<br>Can contain a maximum of 260 characters.<br>Cannot use the following characters: / : ? # [ ] @ ! $ & ' ( ) \ * + , ; = % < > &#124;<br>Cannot start or end with a period.<br>Cannot contain consecutive periods.<br>Cannot consist of only periods.

Each JSON object in the file represents a measurement. You can modify the fields in each object to configure the measurement parameters. To add more measurements, you need to create more JSON objects with properly completed fields.

### Modbus TCP data selection example

```json
[
  {
    "Selected": true,
    "Name": "Measurement1",
    "UnitId": 0,
    "RegisterType": 1,
    "RegisterOffset": 0,
    "DataTypeCode": 1,
    "BitMap": "",
    "ConversionFactor": null,
    "ConversionOffset": null,
    "StreamId": "SampleStreamID1",
    "ScanRate": 0
  },
  {
    "Selected": true,
    "Name": "Measurement2",
    "UnitId": 247,
    "RegisterType": 2,
    "RegisterOffset": 65535,
    "DataTypeCode": 10,
    "BitMap": "",
    "ConversionFactor": 1,
    "ConversionOffset": 0,
    "StreamId": "",
    "ScanRate": 86400000
  },
  {
    "Selected": true,
    "Name": "Measurement3",
    "UnitId": 1,
    "RegisterType": 3,
    "RegisterOffset": 1,
    "DataTypeCode": 20,
    "BitMap": "16151413",
    "ConversionFactor": 2,
    "ConversionOffset": 3.4,
    "StreamId": "Sample Stream ID 2",
    "ScanRate": 1000
  },
  {
    "Selected": true,
    "Name": "Measurement4",
    "UnitId": 1,
    "RegisterType": 4,
    "RegisterOffset": 1,
    "DataTypeCode": 30,
    "BitMap": "30293231",
    "ConversionFactor": 1,
    "ConversionOffset": 2,
    "StreamId": "Sample_Stream_ID_3",
    "ScanRate": 1000
  }
]
```
