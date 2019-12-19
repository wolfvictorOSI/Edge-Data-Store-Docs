---
uid: SystemPortConfiguration
---

# System port configuration

The _System_Port.json_ file specifies the port on which the System is listening for REST API calls. The same port is used for configuration and for writing data to OMF and SDS. The default port is 5590. 

Valid ports are in the range of 1024-65535. 

## Configure system port

Before you change the default, ensure that no other service or application on the computer running Edge Data Store is using that port - only one application or service can use a port. If you change the port number through the REST API, you must restart Edge Data Store.

1. Save the JSON containing the new port number in JSON format to a file named _EdgePort.json_ and run the following script:

    ```bash
    curl -i -d "@EdgePort.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/system/port
    ```

2. After the REST command completes, restart Edge Data Store for the change to take effect.

## System port schema

The following table shows the basic behavior of the _System_Port.json_ file.

| Abstract            | Extensible | Status       | Identifiable | Custom properties | Additional properties | 
| ------------------- | ---------- | ------------ | ------------ | ----------------- | --------------------- | 
| Can be instantiated | Yes        | Experimental | No           | Forbidden         | Forbidden             | 

## Parameters for system port

The following parameters are available for configuring system port.

| Parameter      | Required    | Type   | Nullable | Description                      |
| ------------- | --------- | -------- | -------- | ------------------------------- |
| **Port** | Required | `integer` | No       | The tcp port to bind Edge Data Store to. (Range [1024,65535]) Example: 5590 | 


## System port example

The default _System_Port.json_ file installed is:

```json
{
  "Port": 5590
}
```
