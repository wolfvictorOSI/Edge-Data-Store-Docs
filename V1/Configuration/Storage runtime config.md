---
uid: storageruntime
---

# Storage runtime configuration

Edge Data Store provides a mechanism for configuring runtime characteristics of the storage component.  

> **Note:** The configured defaults are sufficent for most scenarios.  You should modify these values  only after consultation with OSIsoft Support personnel.

## Configure storage runtime

To update the storage runtime configuration, complete the following:

1. Create a JSON file with the storage runtime configuration.
**Note:** See the following *Parameters* table for all available runtime parameters to define.
          See the following *Examples* section for an example of a valid runtime configuration file.
2. Save the JSON file with the name Storage_Runtime.config.json.
3. From the same directory where the file exists, run the following curl script:

```bash
curl -i -d "@Storage_Runtime.config.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/storage/Runtime
```

> **Note:** The @ symbol is a required prefix for the above command.

### Parameters

| Parameter                       | Required | Type     | Description                                        |
|---------------------------------|----------|----------|----------------------------------------------------|
| **IngressDebugExpiration**      | Required | string   | If set, defines how long OMF ingress debug files should be produced. |
| **StreamStorageLimitMb**        | Required | integer  | The maximum size in megabytes that a stream can reach. |
| **StreamStorageTargetMb**       | Required | integer  | The size in megabytes that a stream will be reduced to after StreamStorageLimitMb size is reached for a single stream. |
| **EnableTransactionLog**        | No       | bool     | Enables or disables the transaction log.  The transaction log helps to ensure no data is lost should a device lose power. |
| **TransactionLogLimitMB**       | No       | integer  | Maximum size for transaction log file.  Transaction log files larger than this size will be deleted, resulting is loss of data should the device lose power. |
| **CheckpointRateInSec**         | No       | integer  | How often to flush new data to store.  |


### Examples

The following is a valid runtime configuration example.

```json
{
  "streamStorageLimitMb": 2,
  "streamStorageTargetMb": 1,
  "ingressDebugExpiration": "0001-01-01T00:00:00",
  "checkpointRateInSec": 30,
  "transactionLogLimitMB": 250,
  "enableTransactionLog": true
}```
