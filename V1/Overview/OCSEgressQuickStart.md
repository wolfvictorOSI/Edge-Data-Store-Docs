---
uid: ocsEgressQuickStart
---

# OCS egress quick start

This topic provides quick start instructions for getting data stored in the Edge Data Store into OCS. You can accomplish this by using the OCS OMF endpoint which is configured for OCS authentication.

The examples here use curl, a commonly available tool on both Windows and Linux, and command line commands. You can use the same operations with any programming language or tool that supports making REST calls. You can also accomplish data retrieval steps (GET commands) using a browser, if available on your device.

## Create a periodic egress configuration

The following is an example JSON file to configure Edge Storage periodic egress for the Osisoft Cloud Services (OCS) endpoint and credentials:

```json
[{
    "Id": "OCS",
    "ExecutionPeriod": "00:00:50",
    "Name": null,
    "NamespaceId": "default",
    "Description": null,
    "Enabled": true,
    "Backfill": false,
    "EgressFilter": "",
    "StreamPrefix": "ChangeMe",
    "TypePrefix": "ChangeMe",
    "Endpoint": "https://<your OCS OMF endpoint endpoint>",
    "ClientId": "<your OCS ClientId>",
    "ClientSecret": "<your OCS ClientSecret>",
    "UserName": null,
    "Password": null,
    "DebugExpiration": null,
    "ValidateEndpointCertificate": true,
    "TokenEndpoint": null
}]
```

1. Type the URL of your OCS OMF endpoint into the "Endpoint": value in the preceding JSON file.
2. Type a ClientId and ClientSecret that can write data to your OCS tenant and namespace in the "ClientId": and "ClientSecret": values in the preceding JSON file.

    **Note:** If required, use the StreamPrefix and TypePrefix to ensure uniqueness on the destination system. If a StreamPrefix is specified, it is used to create a unique stream id on OCS. This configuration is set up to send all stream data to OCS. If you want to only send specific streams, edit the EgressFilter value. For examples of more advanced scenarios, see [Data egress configuration](xref:egress).

3. Save the JSON file with the name PeriodicEgressEndpoints.json.
4. Run the following curl script to configure the Edge Storage component to send data to OCS. Run the script from the same directory where the file exists on the device with Edge Data Store installed. You can run the file and curl script from any directory on the device as long as the file and the curl script are run from the same directory:

    ```bash
    curl -i -d "@PeriodicEgressEndpoints.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/storage/PeriodicEgressEndpoints/
    ```

When this command completes successfully, data will start being egressed to OCS.
