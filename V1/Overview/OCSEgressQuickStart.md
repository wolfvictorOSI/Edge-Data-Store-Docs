---
uid: ocsEgressQuickStart
---

# OSIsoft Cloud Services (OCS) egress quick start

This topic is a quick tour of getting data that is stored in the Edge Data Store into OCS. You can accomplish this by using the OCS OMF endpoint which is configured for OCS authentication.

## Create a periodic egress configuration

Configure Edge Storage periodic egress for the Osisoft Cloud Services (OCS) endpoint and credentials:

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

1. To add the URL of your OCS OMF endpoint, edit the previous JSON.
2. Add a ClientId and ClientSecret that can write data to your OCS tenant and namespace.

    **Note:** If required, you can use the StreamPrefix and TypePrefix to ensure uniqueness on the destination system. If a StreamPrefix is specified, it will be used to create a unique stream id on OCS. This configuration is set up to send all stream data to OCS. If you want to only send specific streams, edit the EgressFilter value. Examples of more advanced scenarios are in the Egress section of this documentation.

3. Save the JSON with the file name PeriodicEgressEndpoints.json.
4. Run the following curl script to configure the Edge Storage to send data to OCS. Run the script from the same directory where the file exists on the device where Edge Data Store is installed. You can run the file and curl script from any directory on the device as long as the file and the curl script are run from the same directory:

```bash
curl -i -d "@PeriodicEgressEndpoints.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/storage/PeriodicEgressEndpoints/
```

When this command completes successfully, data will start being sent to OCS.
