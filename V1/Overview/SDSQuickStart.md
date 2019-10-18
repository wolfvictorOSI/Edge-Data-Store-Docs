---
uid: sdsQuickStart
---

# Edge Storage SDS quick start

This quick start gives an overview on how to get data into the Edge Storage component using the Sequential Data Store (SDS) REST API. 

Prerequisites:
  * Edge Data Store installed
  * Edge Data Store accessible through a REST API using the default installed port (5590)

The examples here use curl, a commonly available tool on both Windows and Linux, and command line commands. You can use the same operations with any programming language or tool that supports making REST calls. You can also accomplish data retrieval steps (GET commands) using a browser, if available on your device.

## Create an SDS type

Complete the following to create an SDS type that describes the format of the data to be stored in a container:

1. Create a JSON file using the example below:

```json
{
    "Id": "Simple",
    "Name": "Simple",
    "SdsTypeCode": 1,
    "Properties": [
        {
            "Id": "Time",
            "Name": "Time",
            "IsKey": true,
            "SdsType": {
                "SdsTypeCode": 16
            }
        },
        {
            "Id": "Measurement",
            "Name": "Measurement",
            "SdsType": {
                "SdsTypeCode": 14
            }
        }
    ]
}
```

**Note:** The data to be written is a timestamp and numeric value.  It is indexed by a timestamp, and the numeric value that will be stored is a 64 bit floating point value. 

2. Save the JSON as a file with the name SDSCreateType.json.
3. Run the following curl script:

```bash
curl -i -d "@SDSCreateType.json" -H "Content-Type: application/json"  -X POST http://localhost:5590/api/v1/tenants/default/namespaces/default/types/Simple
```

When the previous command completes successfully, an SDS type with the same name is created on the server. You can create any number of containers from a single type, as long as they use a timestamp as an index and a 32 bit floating point value. You only need to create a type the first time you send data with a custom application. It does not cause an error to resend the same definition at a later time.

## Create an SDS stream

Complete the following to create a stream: 

1. Create a JSON file using the example below:

```json
{
    "Id": "Simple",
    "Name": "Simple",
    "TypeId": "Simple"
}
```

**Note:** This stream references the type you created in the previous step.  An error will occur if the type does not exist when the stream is created. As with an SDS type, you only need to create a stream once before sending data events. Resending the same definition repeatedly does not cause an error.

2. Save the JSON as a file with the name SDSCreateStream.json.
3. Run the following curl script:

```bash
curl -i -d "@SDSCreateStream.json" -H "Content-Type: application/json"  -X POST http://localhost:5590/api/v1/tenants/default/namespaces/default/streams/Simple
```

When the previous command completes successfully, an SDS stream is created on the server to store data defined by the specified type.

## Write data events to the SDS stream

After you have created a type and container, you can write data using SDS. Complete the following to write data to a stream:

1. Create a JSON file using the example below:

```json
[{
    "Time": "2017-11-23T17:00:00Z",
    "Measurement": 50.0
},
{
    "Time": "2017-11-23T18:00:00Z",
    "Measurement": 60.0
}]
```

**Note:** This example includes two data events that will be stored in the SDS Stream you created in the previous steps. As a best practice, you should batch SDS values when writing them for optimal performance.

2. Save the JSON as a file with the name SDSWriteData.json.
3. Run the following curl script:

```bash
curl -i -d "@SDSWriteData.json" -H "Content-Type: application/json"  -X POST http://localhost:5590/api/v1/tenants/default/namespaces/default/streams/Simple/Data
```

When this command completes successfully, two values are written to the SDS stream.

## Read last data written using SDS

You use the SDS REST API to read back data which has been written to the server. The following is an example curl script that reads back the last value entered:

```bash
curl http://localhost:5590/api/v1/tenants/default/namespaces/default/streams/Simple/Data/Last
```

You can also use the following GET command to return the last value written:

```json
{"Time":"2017-11-23T18:00:00Z","Measurement":60.0}
```

## Read a range of data events written using SDS

You use the SDS REST API to read back data which has been written to the server. The following is an example curl script that reads back a time range of values entered:

```bash
curl "http://localhost:5590/api/v1/tenants/default/namespaces/default/streams/Simple/Data?startIndex=2017-07-08T13:00:00Z&count=100"
```

```json
[{"Time":"2017-11-23T17:00:00Z","Measurement":50.0},{"Time":"2017-11-23T18:00:00Z","Measurement":60.0}]
```

Both values that were entered were returned.  A maximum of 100 values after the specified timestamp will be returned.

For more information on SDS APIs, see [Sequential Data Store](xref:sdsOverview).
