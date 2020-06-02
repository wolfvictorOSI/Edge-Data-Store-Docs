---
uid: storage_PeriodicEgressEndpoints_schema
---

# Sample periodic egress configuration

```json
[{
        "Id": "OCS Data",
        "ExecutionPeriod": "00:00:50",
        "Name": null,
        "NamespaceId": "default",
        "Description": null,
        "Enabled": true,
        "Backfill": false,
        "EgressFilter": "",
        "StreamPrefix": "<makeunique>",
        "TypePrefix": "<makeunique>",
        "Endpoint": "https://<OCS OMF endpoint>",
        "ClientId": "<clientid>",
        "ClientSecret": "<clientsecret>",
        "UserName": null,
        "Password": null,
        "DebugExpiration": null,
        "TokenEndpoint": null,
        "ValidateEndpointCertificate": true
    },
    {
        "Id": "PI Web API Data",
        "ExecutionPeriod": "00:00:50",
        "Name": null,
        "NamespaceId": "default",
        "Description": null,
        "Enabled": true,
        "Backfill": false,
        "EgressFilter": "",
        "StreamPrefix": "<makeunique>",
        "TypePrefix": "<makeunique>",
        "Endpoint": "https://<yourserver>/piwebapi/omf/",
        "ClientId": null,
        "ClientSecret": null,
        "UserName": "<username>",
        "Password": "<password>",
        "DebugExpiration": null,
        "TokenEndpoint": null,
        "ValidateEndpointCertificate": true
    },
    {
        "Id": "OCS Diagnostics",
        "ExecutionPeriod": "00:00:50",
        "Name": null,
        "NamespaceId": "diagnostics",
        "Description": null,
        "Enabled": true,
        "Backfill": false,
        "EgressFilter": "",
        "StreamPrefix": "<makeunique>",
        "TypePrefix": "<makeunique>",
        "Endpoint": "https://<OCS OMF endpoint>",
        "ClientId": "<clientid>",
        "ClientSecret": "<clientsecret>",
        "UserName": null,
        "Password": null,
        "DebugExpiration": null,
        "TokenEndpoint": null,
        "ValidateEndpointCertificate": true
    },
    {
        "Id": "PI Web API Diagnostics",
        "ExecutionPeriod": "00:00:50",
        "Name": null,
        "NamespaceId": "diagnostics",
        "Description": null,
        "Enabled": true,
        "Backfill": false,
        "EgressFilter": "",
        "StreamPrefix": "<makeunique>",
        "TypePrefix": "<makeunique>",
        "Endpoint": "https://<yourserver>/piwebapi/omf/",
        "ClientId": null,
        "ClientSecret": null,
        "UserName": "<username>",
        "Password": "<password>",
        "DebugExpiration": null,
        "TokenEndpoint": null,
        "ValidateEndpointCertificate": true
    }
]
```

## Periodic egress configuration properties

| Property                            | Type      | Required     | Nullable | Defined by                                |
| ----------------------------------- | --------- | ------------ | -------- | ----------------------------------------- |
| [Backfill](#backfill)               | `boolean` | Optional     | No       | PeriodicEgressConfiguration (this schema) |
| [ClientId](#clientid)               | `string`  | Optional     | Yes      | PeriodicEgressConfiguration (this schema) |
| [ClientSecret](#clientsecret)       | `string`  | Optional     | Yes      | PeriodicEgressConfiguration (this schema) |
| [DebugExpiration](#debugexpiration) | `string`  | Optional     | Yes      | PeriodicEgressConfiguration (this schema) |
| [Description](#description)         | `string`  | Optional     | Yes      | PeriodicEgressConfiguration (this schema) |
| [EgressFilter](#egressfilter)       | `string`  | Optional     | Yes      | PeriodicEgressConfiguration (this schema) |
| [Enabled](#enabled)                 | `boolean` | Optional     | No       | PeriodicEgressConfiguration (this schema) |
| [Endpoint](#endpoint)               | `string`  | **Required** | No       | PeriodicEgressConfiguration (this schema) |
| [ExecutionPeriod](#executionperiod) | `string`  | **Required** | No       | PeriodicEgressConfiguration (this schema) |
| [Id](#id)                           | `string`  | Optional     | Yes      | PeriodicEgressConfiguration (this schema) |
| [Name](#name)                       | `string`  | Optional     | Yes      | PeriodicEgressConfiguration (this schema) |
| [NamespaceId](#namespaceid)         | `string`  | Optional     | Yes      | PeriodicEgressConfiguration (this schema) |
| [Password](#password)               | `string`  | Optional     | Yes      | PeriodicEgressConfiguration (this schema) |
| [StreamPrefix](#streamprefix)       | `string`  | Optional     | Yes      | PeriodicEgressConfiguration (this schema) |
| [TokenEndpoint](#tokenendpoint)     | `string`  | Optional     | Yes      | PeriodicEgressConfiguration (this schema) |
| [TypePrefix](#typeprefix)           | `string`  | Optional     | Yes      | PeriodicEgressConfiguration (this schema) |
| [UserName](#username)               | `string`  | Optional     | Yes      | PeriodicEgressConfiguration (this schema) |
| [ValidateEndpointCertificate](#validateendpointcertificate) | `boolean` | Optional | No | PeriodicEgressConfiguration (this schema) |


**Note:** All of the following _requirements_ need to be fulfilled.

### Requirement 1

- []() – `#/definitions/EdgeConfigurationBase`

### Requirement 2

`object` with following properties:

| Property                      | Type    | Required     |
| ----------------------------- | ------- | ------------ |
| `Backfill`                    | boolean | Optional     |
| `ClientId`                    | string  | Optional     |
| `ClientSecret`                | string  | Optional     |
| `DebugExpiration`             | string  | Optional     |
| `Description`                 | string  | Optional     |
| `EgressFilter`                | string  | Optional     |
| `Enabled`                     | boolean | Optional     |
| `Endpoint`                    | string  | **Required** |
| `ExecutionPeriod`             | string  | **Required** |
| `Id`                          | string  | Optional     |
| `Name`                        | string  | Optional     |
| `NamespaceId`                 | string  | Optional     |
| `Password`                    | string  | Optional     |
| `StreamPrefix`                | string  | Optional     |
| `TokenEndpoint`               | string  | Optional     |
| `TypePrefix`                  | string  | Optional     |
| `UserName`                    | string  | Optional     |
| `ValidateEndpointCertificate` | boolean | Optional     |
