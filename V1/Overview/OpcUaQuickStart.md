---
uid: opcUaQuickStart
---

# OPC UA EDS adapter quick start

This topic provides a quick start for setting up the OPC UA EDS adapter. You can add a single OPC UA EDS adapter during Edge Data Store installation. If you want multiple OPC UA EDS adapters, see [Edge Data Store Configuration](xref:EdgeDataStoreConfiguration) for adding a new component to Edge Data Store. 

The following diagram depicts the data flow of a single OPC UA EDS adapter:

![EDS Opc Ua](https://osisoft.github.io/Edge-Data-Store-Docs/V1/images/EDSOpcUA.jpg "EDS Opc Ua")

## Configure an OPC UA data source

1. Create a file in JSON format describing the location of the OPC UA data source. The adapter installed during installation is named OpcUa1 in this example. Modify the following values to match your environment.

   ```json
   {
   "EndpointUrl": "opc.tcp://<ip address>:<port - often 62541>/<server path>",
       "UseSecureConnection": false,
       "UserName": null,
       "Password": null,
       "RootNodeIds": null,
       "IncomingTimestamp": "Source",
       "StreamIdPrefix": "OpcUa"
   }
   ```

2. Enter the correct IP address and port for your OPC UA data source.
3. Save the file with the name OpcUa1Datasource.json.
4. Run the following curl script from the same directory where the file is located. You should run the script on the same computer where the Edge Data Store is installed:

```bash
curl -i -d "@OpcUa1Datasource.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/OpcUa1/Datasource
```

When the command completes successfully (a 204 is returned by curl), your OPC UA data source has been created. If you receive a 400 error, check the JSON file for errors. If you receive a 404 or 500 error, check to make sure Edge Data Store is running on your computer.

## Configure OPC UA data selection

When you create the data source file, the OPC UA adapter auto generates the data selection file, which lists all available streams in the designated data source.  To configure the data selection file, complete the following:

1. Save the data selection to your local device for editing.
2. Select each of the streams you want to ingress to Edge Data Store. All steams listed in the auto generated data selection file are initially set to deselect.

3. Save the following JSON content in a text file and name it OpcUa1Dataselection.json.

   ```json
   [{
           "Selected": true,
           "Name": "Cold Side Inlet Temperature",
           "NodeId": "ns=2;s=Line1.HeatExchanger1001.ColdSideInletTemperature",
           "StreamId": null
       },
       {
           "Selected": true,
           "Name": "Hot Side Inlet Temperature",
           "NodeId": "ns=2;s=Line1.HeatExchanger1001.HotSideInletTemperature",
           "StreamId": null
       },
       {
           "Selected": true,
           "Name": "Hot Side Outlet Temperature",
           "NodeId": "ns=2;s=Line1.HeatExchanger1001.HotSideOutletTemperature",
           "StreamId": null
       },
       {
           "Selected": false,
           "Name": "Cold Side Inlet Temperature",
           "NodeId": "ns=2;s=Line1.HeatExchanger1002.ColdSideInletTemperature",
           "StreamId": null
       },
       {
           "Selected": false,
           "Name": "Hot Side Outlet Temperature",
           "NodeId": "ns=2;s=Line1.HeatExchanger1002.HotSideOutletTemperature",
           "StreamId": null
       }
   ]
   ```
   
4. Run the following curl script to configure Edge Data Store to collect OPC UA data values:

   ```bash
   curl -i -d "@OpcUa1Dataselection.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/OpcUa1/Dataselection
   ```

* To see the streams that have been created in Edge Storage to store the data you are writing, run the following curl script:

   ```bash
   curl http://localhost:5590/api/v1/tenants/default/namespaces/default/streams/
   ```

* To view the data in the streams being written, refer to the SDS part of this documentation.

* To egress the data to OSIsoft Cloud Services or the PI System, see the egress documentation or quick starts.
