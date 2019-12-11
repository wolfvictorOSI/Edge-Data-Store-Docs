---
uid: opcUa_DataSelection_schema
---

# Sample OPC UA data selection configuration

The OPC UA data selection configuration schema specifies how to formally describe the data selection parameters for OPC UA.

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
        "Selected": true,
        "Name": "Cold Side Inlet Temperature",
        "NodeId": "ns=2;s=Line1.HeatExchanger1002.ColdSideInletTemperature",
        "StreamId": null
    },
    {
        "Selected": true,
        "Name": "Hot Side Outlet Temperature",
        "NodeId": "ns=2;s=Line1.HeatExchanger1002.HotSideOutletTemperature",
        "StreamId": null
    }
]
```



# OPC UA data selection configuration schema


| Abstract            | Extensible | Status       | Identifiable | Custom properties | Additional properties | Defined in                                                         |
| ------------------- | ---------- | ------------ | ------------ | ----------------- | --------------------- | ------------------------------------------------------------------ |
| Can be instantiated | Yes        | Experimental | No           | Forbidden         | Forbidden             | [OpcUa_DataSelection_schema.json](OpcUa_DataSelection_schema.json) |

# OPC UA data selection configuration properties

| Property              | Type      | Required | Nullable | Defined by                       |
| --------------------- | --------- | -------- | -------- | -------------------------------- |
| [Name](#name)         | `string`  | Optional | Yes      | DataCollectionItem (this schema) |
| [NodeId](#nodeid)     | `string`  | Optional | Yes      | DataCollectionItem (this schema) |
| [Selected](#selected) | `boolean` | Optional | No       | DataCollectionItem (this schema) |
| [StreamId](#streamid) | `string`  | Optional | Yes      | DataCollectionItem (this schema) |



**Note:** All of the following _requirements_ need to be fulfilled.

## Requirement 1

- []() – `#/definitions/EdgeConfigurationBase`

## Requirement 2

`object` with following properties:

| Property   | Type    | Required |
| ---------- | ------- | -------- |
| `Name`     | string  | Optional |
| `NodeId`   | string  | Optional |
| `Selected` | boolean | Optional |
| `StreamId` | string  | Optional |
