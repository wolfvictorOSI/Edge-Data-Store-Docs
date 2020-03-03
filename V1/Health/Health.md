---
uid: EdgeDataStoreHealth
---

# Edge Data Store health

Insight into the health of the Edge Data Store and the components that make it up can be critical for ensuring that your needs for data collection are being met. To that end, Edge Data Store and its components produce health information. When configured, Edge Data Store transfers health information to OMF endpoints, including the types and containers that represent available health information. To enable this functionality, you must configure one or more health endpoints.

## EDS adapter health

The following health types and streams are created to reflect the health of EDS adapters.

The Connectors static type includes these properties and servers as a root AF element with the ID Connectors.

| Property     | Type     | Description      |
|--------------|----------|------------------|
| Id | string | Connectors - root AF element |
| Description | string | Collection of Connector assets |

### EDS adapter health

The Connector Health static type includes the following properties, which are logged in a stream with the ID {machinename}.{componentid}. The stream is linked to root AF element (Connectors).

| Property     | Type     | Description      |
|--------------|----------|------------------|
| Id | string  | {machinename}.{componentId} |
| Description | string | {productname} health |
| Connector Type | string | {adaptertype} |
| Version | string | {adapterversion} |

### Device status

The DeviceStatus dynamic type includes the following values, which are logged in a stream with the ID Connectors.{machinename}.{componentid}.DeviceStatus. The stream is linked to {machinename}.{componentid} static stream.

| Property     | Type     | Description      |
|--------------|----------|------------------|
| Time | string | Timestamp of event |
| DeviceStatus | string | Device status value |

### Next health message expected

The NextHealthMessageExpected dynamic type includes the following values, which are logged in a stream with the ID Connectors.{machinename}.{componentid}.NextHealthMessageExpected. The stream is linked to {machinename}.{componentid} static stream. Heard beat message is expected once a minute.

| Property     | Type     | Description      |
|--------------|----------|------------------|
| Time | string | Timestamp of event |
| NextHealthMessageExpected | string | Time when next health message is expected. |

## Storage component health

The following health types and streams are created to reflect the health of the Storage component.

The Storage static type includes the following properties and servers as a root AF element with the ID Storage.

| Property     | Type     | Description      |
|--------------|----------|------------------|
| Id | string | Storage - root AF element |
| Description | string | Storage Health |

### Storage health

The Storage Health static type includes the following properties, which are logged in a stream with the ID {machinename}.Storage. The stream is linked to root AF element (Storage).

| Property     | Type     | Description      |
|--------------|----------|------------------|
| Id | string  | {machinename}.Storage |
| Description | string | {productname} health |
| Connector Type | string | {adaptertype} |
| Version | string | {storageversion} |

### Storage device status

The DeviceStatus dynamic type includes the following values, which are logged in a stream with the ID Storage.{machinename}.DeviceStatus. The stream is linked to {machinename}.Storage static stream.

| Property     | Type     | Description      |
|--------------|----------|------------------|
| Time | string | Timestamp of event |
| DeviceStatus | string | Device status value |

### Storage next health message expected

The NextHealthMessageExpected dynamic type includes the following values, which are logged in a stream with the ID Storage.{machinename}.NextHealthMessageExpected. The stream is linked to {machinename}.Storage static stream. Heard beat message is expected once a minute.

| Property     | Type     | Description      |
|--------------|----------|------------------|
| Time | string | Timestamp of event |
| NextHealthMessageExpected | string | Time when next health message is expected. |
