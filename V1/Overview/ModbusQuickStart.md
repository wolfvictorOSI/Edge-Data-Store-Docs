---
uid: modbusQuickStart
---

# Modbus TCP EDS adapter quick start

The Modbus TCP EDS adapter is a component of Edge Data Store that defines connections to and receives data from Modbus TCP capable devices. The Modbus TCP EDS adapter can connect to multiple devices by defining one instance of the adapter for each device. The EDS installation includes the Modbus TCP EDS adapter and the option to add a single Modbus TCP EDS adapter instance. Additional instances can be configured after installation. For more information about installation, see [Install Edge Data Store](xref:InstallEdgeDataStore). To get started collecting data with an instance of the Modbus TCP EDS adapter, you need to configure the data source, which specifies the device connection, and the data selection, which specifies the data to collect.

The following diagram depicts the data flow of a single instance of Modbus TCP EDS adapter:

![Modbus TCP EDS](https://osisoft.github.io/Edge-Data-Store-Docs/V1/images/ModbusTCP.jpg "Modbus TCP EDS")

The adapter instance requests data from the Modbus TCP device and then the device sends its data. The adapter sends the collected data to the storage component where it is held until it can be egressed to permanent storage in PI Server or OSIsoft Cloud Services. The adapter instance can be configured from the device where EDS is installed, and EDS collects health information about the adapter that can be egressed.

## Configure a Modbus TCP data source

1. Create a file in JSON format describing the location of the Modbus TCP data source. The adapter installed during installation is named Modbus1 in this example. Modify the following values to match your environment.

   ```json
   {
       "IpAddress": "<Modbus IP Address>",
       "Port": <Port - usually 502>,
       "ConnectTimeout": 15000,
       "ReconnectInterval": 5000,
       "RequestTimeout": 9000,
       "DelayBetweenRequests": 0,
       "MaxResponseDataLength": 250
   }
   ```

2. Enter the correct IP address and port for your Modbus data source.
3. Save the file with the name Modbus1DataSource.json. 
4. Run the following curl script from the same directory where the file is located. 

**Note:** You should run the script on the same computer where the Edge Data Store is installed.

   ```bash
   curl -d "@Modbus1Datasource.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/Modbus1/Datasource
   ```

When the command completes successfully (a 204 is returned by curl), your Modbus TCP data source has been created. If you get a 400 error, check the JSON file for errors. If you get a 404 or 500 error, check that Edge Data Store is running on your device.

## Configure Modbus TCP data selection

After you create the data source file, you select the streams you want to store in Edge Data Store by configuring Modbus data selection.  To configure the data selection file, complete the following:

1. Create a file in JSON format to define each stream you want to ingress to Edge Data Store. 
2. Save the following JSON content in a text file and name it Modbus1Dataselection.json. Modify the following values to match your environment:

   ```json
   [{
           "Selected": "true",
           "UnitId": 1,
           "RegisterType": 3,
           "RegisterOffset": 1,
           "DataTypeCode": 20,
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
           "ConversionFactor": 2,
           "ConversionOffset": 3.4,
           "ScanRate": 500
       }
   ]
   ```

3. Run the following curl script to configure Edge Data Store to collect Modbus TCP data values:

   ```bash
   curl -d "@Modbus1Dataselection.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/Modbus1/Dataselection
   ```

