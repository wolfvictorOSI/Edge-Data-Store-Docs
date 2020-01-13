---
uid: modbusQuickStart
---

# Modbus TCP EDS adapter quick start

This topic provides quick start instructions for setting up the EDS Modbus TCP adapter. You can add a single EDS Modbus TCP adapter during Edge Data Store installation. You can add a single EDS Modbus TCP adapter during [Edge Data Store installation](xref:InstallEdgeDataStore).

The following diagram depicts the data flow of a single EDS Modbus TCP adapter:

![EDS Modbus TCP](https://osisoft.github.io/Edge-Data-Store-Docs/V1/images/EDSModbusTCP.jpg "EDS Modbus TCP")

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
   curl -i -d "@Modbus1Datasource.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/Modbus1/Datasource
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
           "BitMap": "16151413",
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
           "BitMap": "16151413",
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
           "BitMap": "16151413",
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
           "BitMap": "16151413",
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
           "BitMap": "16151413",
           "ConversionFactor": 2,
           "ConversionOffset": 3.4,
           "ScanRate": 500
       }
   ]
   ```

3. Run the following curl script to configure Edge Data Store to collect Modbus TCP data values:

   ```bash
   curl -i -d "@Modbus1Dataselection.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/Modbus1/Dataselection
   ```

