---
uid: system_HealthEndpoints_schema
---

# Sample OMF health endpoint configuration

The OMF health endpoint configuration schema specifies how to formally describe the OMF health endpoint parameters.

```json
[{
        "endpoint": "https://<pi web api server>/piwebapi/omf/",
        "UserName": "<username>",
        "Password": "<password>",
        "buffering": 0,
        "maxBufferSizeMB": 0
    },
    {
        "Endpoint": "https://<OCS OMF endpoint>",
        "ClientId": "<clientid>",
        "ClientSecret": "<clientsecret>",
        "buffering": 0,
        "maxBufferSizeMB": 0
    }
]
```

# OMF health endpoint configuration properties

| Property                                                    | Type      | Required | Nullable | Defined by                                   |
| ----------------------------------------------------------- | --------- | -------- | -------- | -------------------------------------------- |
| [Buffering](#buffering)                                     | reference <br> `#/definitions/BufferType` | Optional | No       | OmfHealthEndpointConfiguration (this schema) |
| [ClientId](#clientid)                                       | `string`  | Optional | Yes      | OmfHealthEndpointConfiguration (this schema) |
| [ClientSecret](#clientsecret)                               | `string`  | Optional | Yes      | OmfHealthEndpointConfiguration (this schema) |
| [Endpoint](#endpoint)                                       | `string`  | Optional | Yes      | OmfHealthEndpointConfiguration (this schema) |
| [Id](#id)                                                   | `string`  | Optional | Yes      | OmfHealthEndpointConfiguration (this schema) |
| [MaxBufferSizeMB](#maxbuffersizemb)                         | `integer` | Optional | No       | OmfHealthEndpointConfiguration (this schema) |
| [Password](#password)                                       | `string`  | Optional | Yes      | OmfHealthEndpointConfiguration (this schema) |
| [UserName](#username)                                       | `string`  | Optional | Yes      | OmfHealthEndpointConfiguration (this schema) |
| [ValidateEndpointCertificate](#validateendpointcertificate) | `boolean` | Optional | No       | OmfHealthEndpointConfiguration (this schema) |


**Note:** All of the following _requirements_ need to be fulfilled.

## Requirement 1

- []() – `#/definitions/EdgeConfigurationBase`

## Requirement 2

`object` with following properties:

| Property                      | Type    | Required |
| ----------------------------- | ------- | -------- |
| `Buffering`                   | reference <br> `#/definitions/BufferType` | Optional |
| `ClientId`                    | string  | Optional |
| `ClientSecret`                | string  | Optional |
| `Endpoint`                    | string  | Optional |
| `Id`                          | string  | Optional |
| `MaxBufferSizeMB`             | integer | Optional |
| `Password`                    | string  | Optional |
| `UserName`                    | string  | Optional |
| `ValidateEndpointCertificate` | boolean | Optional |
