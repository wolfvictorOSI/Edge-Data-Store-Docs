---
uid: omfQuickStart
---

# OMF quick start

This topic provides quick start instructions for getting data into the Edge Storage component using the OSIsoft Message Format (OMF), and then retrieving that data using the Sequential Data Store (SDS) REST API. Both OMF data ingress and SDS data retrieval are accomplished using REST APIs.  

## Create an OMF type

The first step in OMF data ingress is to create an OMF type that describes the format of the data to be stored in a container. In this example, the data to be written is a timestamp and a numeric value.

1. Create an OMF JSON file describing the type as follows:

   ```json
   [{
       "id": "MyCustomType",
       "classification": "dynamic",
       "type": "object",
       "properties": {
           "Timestamp": {
               "type": "string",
               "format": "date-time",
               "isindex": true
           },
           "Value": {
               "type": "number",
               "format": "float32"
           }
       }
   }]
   ```

   The value is indexed by a timestamp, and the numeric value that will be stored is a 32-bit floating point value.
   
2. In order to create the OMF type in Edge Storage, store the JSON file with the name OmfCreateType.json on the local device.
3. Run the following curl command:

   ```bash
   curl -i -d "@OmfCreateType.json" -H "Content-Type: application/json" -H "producertoken: x " -H "omfversion: 1.1" -H "action: create" -H "messageformat: json" -H "messagetype: type" -X POST http://localhost:5590/api/v1/tenants/default/namespaces/default/omf/
   ```

When this command completes successfully, an SDS type with the same name will have been created on the server. Any number of containers can be created from the type, as long as they use a timestamp as an index and have a 32-bit floating point value. You only need to send the Type definition the first time you send data, but it does not cause an error if you resend the same definition at a later time.

## Create an OMF container

The next step in writing OMF data is to create a container. As with an OMF type, this only needs to be done once before sending data events, and resending the same definition repeatedly does not cause an error.

1. Create an OMF JSON file as follows:

   ```json
   [{
       "id": "MyCustomContainer",
       "typeid": "MyCustomType"
   }]
   ```

   This container references the OMF type that was created earlier, and an error will occur if the type does not exist when the container is created. 
   
2. To create the OMF container in the Edge Storage, store the JSON file with the name OmfCreateContainer.json on the local device.
3. To create the SDS stream to store data defined by the type, run the following curl command:

   ```bash
   curl -i -d "@OmfCreateContainer.json" -H "Content-Type: application/json" -H "producertoken: x " -H "omfversion: 1.1" -H "action: create" -H "messageformat: json" -H "messagetype: container" -X POST http://localhost:5590/api/v1/tenants/default/namespaces/default/omf/
   ```

## Write data events to the OMF container

1. Create an OMF JSON file to define data events to be stored in the SDS Stream created in the previous steps. For best performance, you should batch OMF values together, as in the following example: 

   ```json
   [{
       "containerid": "MyCustomContainer",
       "values": [{
               "Timestamp": "2019-07-16T15:18:24.9870136Z",
               "Value": 12345.6789
           },
           {
               "Timestamp": "2019-07-16T15:18:25.9870136Z",
               "Value": 12346.6789
           }
       ]
   }]
   ```

2. To write the data in the Edge Storage, store the JSON file with the name OmfCreateDataEvents.json on the local device.
3. To write data values to the SDS stream, run the following curl command:

   ```bash
   curl -i -d "@OmfCreateDataEvents.json" -H "Content-Type: application/json" -H "producertoken: x " -H "omfversion: 1.1" -H "action: create" -H "messageformat: json" -H "messagetype: data" -X POST http://localhost:5590/api/v1/tenants/default/namespaces/default/omf/
   ```

## Read Last Data written using SDS

Complete the following to use the SDS REST API to read back the data written to the server. 

1. Start the curl command line tool.
2. Execute the following curl command to return the last value written:

   ```bash
   curl http://localhost:5590/api/v1/tenants/default/namespaces/default/streams/MyCustomContainer/Data/Last
   ```

   Sample output:
   
   ```json
   {"Timestamp": "2019-07-16T15:18:25.9870136Z", "Value": 12346.6789}
   ```

## Read a range of data events written using SDS

Complete the following to use the SDS REST API to read back the data written to the server. 

1. Start the curl command line tool.
2. Execute the following curl command to return up to 100 values after the startIndex specified:

   ```bash
   curl "http://localhost:5590/api/v1/tenants/default/namespaces/default/streams/MyCustomContainer/Data?startIndex=2017-07-08T13:00:00Z&count=100"
   ```

   Sample output:
   
   ```json
   [{"Timestamp": "2019-07-16T15:18:24.9870136Z","Value": 12345.6789}, {"Timestamp": "2019-07-16T15:18:25.9870136Z", "Value": 12346.6789}]
   ```

   Both values that were entered are returned. This command returns up to 100 values after the specified timestamp.

